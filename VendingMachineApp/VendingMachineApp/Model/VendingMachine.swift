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
    
<<<<<<< HEAD
    // 현금 투입
    public mutating func addCash(cash: Int) {
        self.account += cash
    }
    
    // 앞서 현금 투입 함수가 있지만, 개인적으로 정리할 내용이 있어 남겨뒀습니다.
    // Test에 내용을 다시 남기겠습니다.
=======
    // 금액 올리기
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    public mutating func insertCash(cash: Int) -> Int {
        return account + cash
    }
    
<<<<<<< HEAD
    // 재고 추가
    public mutating func addBeverage(beverage: Beverage) {
        inventoryList.append(beverage)
=======
    public mutating func addCash(cash: Int) {
        self.account += cash
    }
    
    // 재고 추가
    public mutating func addBeverage(variety: Category) {
        let factory = BeverageFactory()
        inventoryList.append(factory.addBeverage(variety: variety))
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
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
<<<<<<< HEAD
    public mutating func sell(one : Beverage) {
        remove(one: one)
        purchaseHistory.append(one)
=======
    public mutating func purchaseEvent() {
        if let selected = showPurchasable().randomElement() {
            purchaseHistory.append(selected)
            remove(one: selected)
        }
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    }
    
    // 잔액 확인
    public mutating func showAccount() -> Int {
        return account
    }
    
<<<<<<< HEAD
    // 전체 재고 확인
=======
    // 전체 재고 리턴
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    public mutating func showInventory() -> [Beverage] {
        return inventoryList
    }
    
    // 유통기한 만료 제품
    public mutating func showExpired() -> [Beverage] {
<<<<<<< HEAD
        return inventoryList.filter( { $0.isNotExpired() == false } )
    }
    
    // 따뜻한 음료만 배열로
    public mutating func hotBeverage() -> [Beverage] {
        let hotBeverage = inventoryList.filter{ sku in
            if let coffee = sku as? Coffee {
                if coffee.hot() {
                    return true
                }
            }
            return false
        }
        return hotBeverage
=======
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
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    }
    
    // 시작 이후 구매 상품 이력을 배열로
    public mutating func showHistory() -> [Beverage] {
        return purchaseHistory
    }
    
}

<<<<<<< HEAD
=======
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
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
