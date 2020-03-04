//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by delma on 29/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
struct VendingMachine {
    var beverages: Beverages
    var money: [String:Int] = ["fiveThousand" : 0, "thousand" : 0, "fiveHundred" : 0, "hundred" : 0]
    
    func showTotalStock() {
//        beverages.forEach { print($0.description) }
    }
//    자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func raiseMoney(fiveThousandCount: Int, thousandCount: Int, fiveHundredCount: Int, hundredCount: Int) {
        let insertedMoney = [fiveThousandCount, thousandCount, fiveHundredCount, hundredCount]
        for moneyType in insertedMoney {
            let key = String(moneyType) + "Count"
             guard let value = money[key] else { return }
            money.updateValue(moneyType + value, forKey: key)
        }
    }
//    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addStock() {
        
    }
//    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func reportAvailableStockNowMoney() {
        
    }
//    음료수를 구매하는 메소드
    func purchaseBeverage() {
        //해당 금액만큼 돈 차감
        //음료 갯수  1 차감
    }
//    잔액을 확인하는 메소드
    func confirmBalance() -> Int {
        var balance = 0
        for (key, value) in money {
            var tmp = 0
            if key.contains("thousand") {
                tmp += value * 1000
            }else if key.contains("five") {
                tmp += value * 5
            }
            balance += tmp
        }
        return balance
    }
//    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func reportTotalStock() {
        
    }
//    유통기한이 지난 재고만 확인하는 메소드
    func confirmOverdateStock() {
        
    }
//    따뜻한 음료만 리턴하는 메소드
    func reportWarmBeverage() {
        
    }
//    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func reportPurchaseHistory() {
        
    }
}
