//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 김지나 on 22/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    enum Menu: String {
        case insertMoney = "1"
        case buyBeverage = "2"
    }
    
    private var list: [Beverage]
    private var currentBalance: Int = 0
    private var purchase = [String]()
    
    init() {
        self.list = []
    }
    
    // 현재 보유 중인 음료 리턴
    func drinks(_ list: [Beverage]) -> [Beverage] {
        return list
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
//    // 현재 음료 현황 리턴
//    func currentBeverageStatus() -> [Inventory] {
//        return currentBeverage
//    }
    
    
    /// 음료수 구매
    //구매한 음료 처리
    func sell(beverageNumber: Int) {
        for inner in 0 ..< list.count {
            if beverageNumber == inner {
//                subtract(from: inner)
//                purchaseList(from: inner)
//                deduct(money: inner)
            }
        }
    }

    // 시작이후 구매 상품 이력을 배열로 리턴하는 메소드
//    private func purchaseList(from productNumber: Int) {
//        self.purchase.append(currentBeverage[productNumber].beverageName)
//    }
//
//    // 재고 마이너스
//    private func subtract(from inventory: Int) {
//        self.currentBeverage[inventory].beverageCount -= 1
//    }
//
//    // 잔액 마이너스
//    private func deduct(money: Int) {
//        self.currentBalance = currentBalance - currentBeverage[money].beveragaPrice
//    }

    
    /// 특정 음료 구분
    // 유통기한이 지난 재고만 리턴하는 메소드
    private func notValidDate() -> [Beverage] {
        return list.filter{ $0.validate() == false }
    }

    // 따뜻한 음료만 리턴하는 메소드
    private func hotBeverage() -> [Beverage] {
        let coffee = list.filter{
            if let drink = $0 as? Coffee, drink.isHot() { return drink.isHot() }
            return false
        }
        return coffee
    }
}

