//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 김지나 on 22/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var beverage: [Beverage] {
        return [Strawberry(strawberryContent: 3, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "딸기우유"),
                Chocolate(chocolateContent: 30, grade: .B, brand: "빙그레", volume: 240, price: 1000, productName: "초코우유"),
                Cola(calorie: 200, brand: Cola.company.cocacola, volume: 400, price: 2000, productName: "코카콜라"),
                Sider(carbonicAcidContent: 30, calorie: 300, brand: "코카콜라", volume: 300, price: 2000, productName: "스프라이트"),
                Kanu(kindOfKanu: "아이스블랜드", ice: true, brand: "맥심", volume: 180, price: 500, productName: "카누 아이스 블랜드"),
                TOP(flavor: "라떼", ice: false, brand: "맥심", volume: 200, price: 1400, productName: "TOP카페라떼")]
    }
    private var currentBalance: Int
    private var currentBeverage = [Inventory]()
    private var purchase = [String]()
    
    init(currentBalance: Int = 0) {
        self.currentBalance = currentBalance
    }
    
    // 현재 보유 중인 음료 리턴
    func drinks() -> [Beverage] {
        return self.beverage
    }
    
    // 자판기 금액을 변경해주는 메소드
    mutating func insert(money: Int) {
        self.currentBalance = currentBalance + money
    }
    
    // 현재 잔액 리턴
    func balance() -> Int {
        return self.currentBalance
    }
    

    /// 음료 내역
    mutating func inventory() {
        for i in beverage {
            self.currentBeverage.append(Inventory(beverageName: i.beverageName, beveragaPrice: i.beveragePrice, beverageCount: 10))
        }
    }
    // 현재 음료 현황 리턴
    func currentBeverageStatus() -> [Inventory] {
        return currentBeverage
    }
    
    
    /// 음료수 구매
    // 구매한 음료 처리
    mutating func sell(beverageNumber: Int) {
        for inner in 0 ..< currentBeverage.count {
            if beverageNumber == inner {
                subtract(from: inner)
                purchaseList(from: inner)
                deduct(money: inner)
            }
        }
    }
    
    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    private mutating func purchaseList(from productNumber: Int) {
        self.purchase.append(currentBeverage[productNumber].beverageName)
    }

    // 재고 마이너스
    private mutating func subtract(from inventory: Int) {
        self.currentBeverage[inventory].beverageCount -= 1
    }
    
    // 잔액 마이너스
    private mutating func deduct(money: Int) {
        self.currentBalance = currentBalance - currentBeverage[money].beveragaPrice
    }
    
    
    /// 특정 음료 구분
    // 유통기한이 지난 재고만 리턴하는 메소드
    private func notValidDate() -> [Beverage] {
        return beverage.filter{ $0.validate() == false }
    }

    // 따뜻한 음료만 리턴하는 메소드
    private func hotBeverage() -> [Beverage] {
        let coffee = beverage.filter{
            let drink = $0 as? Coffee
                if drink?.isHot() == true { return true }
            return false
        }
        return coffee
    }
}
