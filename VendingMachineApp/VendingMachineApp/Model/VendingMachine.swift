//
//  BeverageSKU.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/25.
//

import Foundation

struct VendingMachine {
    
    private var inventoryList = [Beverage]()
    private var account = 0
    private var purchaseHistory = [Beverage]()
    
    // 금액 올리기
    public mutating func insertCash(cash: Int) -> Int {
        return account + cash
    }
    
    public mutating func addCash(cash: Int) {
        self.account += cash
    }
    
    // 재고 추가
    public mutating func addBeverage(variety: Category) {
        let factory = BeverageFactory()
        inventoryList.append(factory.addBeverage(variety: variety))
    }
    
    // 구매 가능 음료 목록
    public mutating func showPurchasable() -> [Beverage] {
        return inventoryList.filter( {$0.showPrice() <= account} )
    }
    
    // 특정 음료 제거, Equtable?
    public mutating func remove(one: Beverage) {
        if let one = inventoryList.firstIndex(of: one) {
            inventoryList.remove(at: one)
        }
    }
    
    // 음료 구매
    public mutating func purchaseEvent() {
        if let selected = showPurchasable().randomElement() {
            purchaseHistory.append(selected)
            remove(one: selected)
        }
    }
    
    // 잔액 확인
    public mutating func showAccount() -> Int {
        return account
    }
    
    // 전체 재고 리턴
    public mutating func showInventory() -> [Beverage] {
        return inventoryList
    }
    
    // 유통기한 만료 제품
    public mutating func showExpired() -> [Beverage] {
        return inventoryList.filter( {$0.showExpiration() < Date()} )
    }
    
    // 뜨뜻
    public mutating func hotBeverage() -> [Beverage] {
        var list = [Beverage]()
        inventoryList.forEach{ (product) in
            if let coffee = product as? CoffeeSKU {
                if coffee.isHot() == true {
                    list.append(coffee)
                }
            }
        }
        return list
    }
    
    // 시작 이후 구매 상품 이력을 배열로
    public mutating func showHistory() -> [Beverage] {
        return purchaseHistory
    }
    
}

extension VendingMachine {
    
    public mutating func findCoffee() -> [Beverage] {
        var coffeeList: [Beverage] = [CoffeeSKU]()
        let coffee = inventoryList.filter{ $0 is CoffeeSKU }
        coffeeList.append(contentsOf: coffee)
        return coffeeList
    }
    
//    public mutating func findHotCoffee() -> [Beverage] {
//        var coffeeList: [Beverage] = [CoffeeSKU]()
//        coffeeList.append(contentsOf: findCoffee())
//        coffeeList.filter{ $0.isHot == true } // Value of type 'Beverage' has no member 'isHot'
//    }
    
}
