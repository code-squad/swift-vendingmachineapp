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

final class VendingMachine: VendingMachineManagementable, VendingMachineUseable, Codable {
    
    static let sharedInstance = VendingMachine()
    
    private var balance = Money()
    private var stock = [Drink]()
    private var sellList = [Drink]()
    
    
    private init() {
        
    }
    
    func supply(_ index: Int, amount: Int) {
        let supplyableDrinks = SupplyableDrinkList.getSupplyableDrinkList()
        
        for _ in 0..<amount {
            stock.append(supplyableDrinks[index])
        }
        
        notifyStockToObservers()
    }
    
    func getAbleDrinks () -> [Drink] {
        let supplyableDrinks = SupplyableDrinkList.getSupplyableDrinkList()
        
        return supplyableDrinks
    }
    
    /// 전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getStockList () -> Dictionary<Drink, Int> {
        var stockList = Dictionary<Drink, Int>()
        
        for drink in stock {
            let stockCount = getStockCount(drink, stockList)
            stockList[drink] = stockCount
        }
        
        return stockList
    }
    
    private func getStockCount (_ drink: Drink, _ stockList: Dictionary<Drink, Int>) -> Int {
        if let stockCount = stockList[drink] {
            return stockCount + 1
        }
        
        return 1
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
    }
    
    /// 잔액을 확인하는 메소드
    func getBalance () -> Money {
        return balance
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func getSellList () -> [Drink] {
        return sellList
    }
    
    /// 잔고를 옵저버에게 알리기
    private func notifyBalanceToObservers () {
        let balance = getBalance()
        NotificationCenter.default.post(name: .refreshBalance, object: nil, userInfo: ["balance":balance])
    }
    
    /// 재고를 옵저버에게 알리기
    private func notifyStockToObservers () {
        let stock = getStockList()
        NotificationCenter.default.post(name: .refreshStock, object: nil, userInfo: ["stock":stock])
    }
}
