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
    
    // 현금 투입
    public mutating func addCash(cash: Int) {
        self.account += cash
    }
    
    // 앞서 현금 투입 함수가 있지만, 개인적으로 정리할 내용이 있어 남겨뒀습니다.
    // Test에 내용을 다시 남기겠습니다.
    public mutating func insertCash(cash: Int) -> Int {
        return account + cash
    }
    
    // 재고 추가
    public mutating func addBeverage(beverage: Beverage) {
        inventoryList.append(beverage)
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
    public mutating func sell(one : Beverage) {
        remove(one: one)
        purchaseHistory.append(one)
    }
    
    // 잔액 확인
    public mutating func showAccount() -> Int {
        return account
    }
    
    // 전체 재고 확인
    public mutating func showInventory() -> [Beverage] {
        return inventoryList
    }
    
    // 유통기한 만료 제품
    public mutating func showExpired() -> [Beverage] {
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
    }
    
    // 시작 이후 구매 상품 이력을 배열로
    public mutating func showHistory() -> [Beverage] {
        return purchaseHistory
    }
    
    public mutating func countSKUQuantity<T>(_: T.Type) -> Int {
        return inventoryList.compactMap({ (element) in
            return element as? T
        }).count
    }
    
}
