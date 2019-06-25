//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

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

struct VendingMachine: VendingMachineManagementable, VendingMachineUseable {
    private var balance = Money()
    private var stock = [Drink]()
    private var sellList = [Drink]()
    
    private let bananaMilk: BananaMilk
    private let strawberryMilk: StrawberryMilk
    private let fanta: Fanta
    private let top: TOP
    private let hot6: Hot6
    private let pepsiCoke: PepsiCoke
    private let drinks: [Drink]
    
    init () {
        bananaMilk = BananaMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190301", farmCode: 5, expirationDate: "20190930")
        strawberryMilk = StrawberryMilk(brand: "빙그레", ml: 200, price: 1300, productDate: "20190405", farmCode: 3, expirationDate: "20190925")
        fanta = Fanta(brand: "롯데", ml: 350, price: 2000, productDate: "20190505", orangeIncense: 0.7, expirationDate: "20190921")
        top = TOP(brand: "맥심", ml: 400, price: 3000, productDate: "20190606", hot: false, expirationDate: "20190920")
        hot6 = Hot6(brand: "롯데", ml: 240, price: 1000, productDate: "20190529", expirationDate: "20191029")
        pepsiCoke = PepsiCoke(brand: "펩시", ml: 255, price: 1200, productDate: "20190610", expirationDate: "20191010")
        drinks = [bananaMilk, strawberryMilk, fanta, top, hot6, pepsiCoke]
    }
    
    mutating func supply(_ index: Int, amount: Int) {
        for _ in 1...amount {
            stock.append(drinks[index-1])
        }
    }
    
    func getAbleDrinks () -> [Drink] {
        return drinks
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
    
    func getStockCount (_ drink: Drink, _ stockList: Dictionary<Drink, Int>) -> Int {
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
    mutating func insertCoin(_ coin: Int) {
        balance.addBalance(coin)
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
    mutating func buy (_ drink: Drink) throws {
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
    }
    
    /// 잔액을 확인하는 메소드
    func getBalance () -> Money {
        return balance
    }
    
    /// 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func getSellList () -> [Drink] {
        return sellList
    }
}
