//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let refreshStock = Notification.Name("refreshStock")
    static let refreshBalance = Notification.Name("refreshBalance")
    static let refreshSellDrink = Notification.Name("refreshSellDrink")
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

final class VendingMachine: VendingMachineManagementable, VendingMachineUseable, Codable, BalancePrintable, SellDrinkPrintable {
    static let sharedInstance = VendingMachine()
    
    private var balance = Money()
    private var stock = [Drink]()
    private var sellList = [Drink]()
    
    
    private init() {

    }
    
    func supply(_ drinkMenu: DrinkMenu, amount: Int) {
        let supplyableDrink = drinkMenu.getSample()
        
        for _ in 0..<amount {
            stock.append(supplyableDrink)
        }
        
        notifyStockToObservers()
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getStockList () -> Dictionary<DrinkMenu, Int> {
        var stockList = Dictionary<DrinkMenu, Int>()
        
        for drinkMenu in DrinkMenu.allCases {
            let stockCount = getStockCount(drinkMenu)
            stockList[drinkMenu] = stockCount
        }
        
        return stockList
    }
    
    private func getStockCount (_ drinkMenu: DrinkMenu) -> Int {
        var count = 0
        
        for drink in stock {
            if drink == drinkMenu.getSample() {
                count += 1
            }
        }
        
        return count
    }
    
    /// 유통기한이 지난 재고만 리턴하는 메소드
    func getExpiredDrinkList () -> [Drink] {
        var expiredDrinks = stock.filter() { (drink: Drink) -> Bool in
            return !drink.validate()
        }
        
        expiredDrinks.removeDuplicates()
        
        return expiredDrinks
    }
    
    /// 따뜻한 음료만 리턴하는 메소드
    func getHotDrinkList () -> [Drink] {
        var hotDrinks = stock.filter() { (drink: Drink) -> Bool in
            let coffee = drink as! Coffee
            return coffee.isHot()
        }
        
        hotDrinks.removeDuplicates()
        
        return hotDrinks
    }
    
    /// 메뉴를 리턴하는 메소드
    func getMenu () -> Dictionary<Int, String> {
        var menu = Dictionary<Int, String>()
        
        for managementMenu in ManagementMenu.allCases {
            menu[managementMenu.rawValue] = managementMenu.localizedDescription
        }
        
        return menu
    }
    
    
    /// 자판기 금액을 원하는 금액만큼 올리는 메소드
    func insertCoin(_ coin: Int) {
        balance.addBalance(coin)
        
        notifyBalanceToObservers()
    }
    
    /// 현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getBuyableDrinkList () -> [Drink] {
        var buyableDrinks = stock.filter() { (drink: Drink) -> Bool in
            return drink.isBuyable(balance)
        }
        buyableDrinks.removeDuplicates()
        
        return buyableDrinks
    }
    
    /// 인덱스로 buy 메소드를 이용해서 음료수를 구매하는 메소드
    func buyToDrinkMenu (_ drinkMenu: DrinkMenu) throws {
        let supplyableDrink = drinkMenu.getSample()
        
        try buy(supplyableDrink)
    }
    
    /// 음료수를 구매하는 메소드
    func buy (_ drink: Drink) throws {
        let drinkIndex = stock.firstIndex(of: drink)
        
        guard let buyDrinkIndex = drinkIndex else {
            throw BuyError.NonStock
        }
    
        guard stock[buyDrinkIndex].isBuyable(balance) else {
            throw BuyError.NotEnoughBalance
        }
        
        sellList.append(drink)
        stock.remove(at: buyDrinkIndex)
        
        try balance.minusBalance(drink.getPrice())
        
        notifyBalanceToObservers()
        notifyStockToObservers()
        notifySellDrinkToObservers()
    }
    
    /// 잔고가 변경됬다는 것을 옵저버에게 알리기
    private func notifyBalanceToObservers () {
        NotificationCenter.default.post(name: .refreshBalance, object: nil)
    }
    
    /// 재고가 변경됬다는 것을 옵저버에게 알리기
    private func notifyStockToObservers () {
        NotificationCenter.default.post(name: .refreshStock, object: nil)
    }
    
    /// 판매 음료가 변경됬다는 것을 옵저버에게 알리기
    private func notifySellDrinkToObservers () {
        NotificationCenter.default.post(name: .refreshSellDrink, object: nil)
    }
    
    func printBalance(handler: (Money) -> ()) {
        handler(balance)
    }
    
    func printStock(handler: (DrinkMenu, Int) -> ()) {
        let stock = getStockList()
    
        for (drinkMenu, count) in stock {
            handler(drinkMenu, count)
        }
    }
    
    func printSellDrinkList(handler: (Int, DrinkMenu) -> ()) {
        for (index, drink) in sellList.enumerated() {
            let drinkMenu = DrinkMenu.getDrinkMenu(drink)
            
            handler(index+1, drinkMenu)
        }
    }
    
    func printSellDrink(handler: (Int, DrinkMenu) -> ()) {
        let sellDrink = sellList.last!
        let drinkMenu = DrinkMenu.getDrinkMenu(sellDrink)
        
        handler(sellList.count, drinkMenu)
    }
    
    func drawPieGraph(handler: (DrinkMenu, Int) -> ()) {
        let stock = getStockList()
        
        for (drinkMenu, count) in stock {
            handler(drinkMenu, count)
        }
    }
}
