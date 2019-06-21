//
//  OutputVIew.swift
//  VendingMachine
//
//  Created by 김지나 on 22/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 출력
struct OutputView {
    static func currentStatus(_ money: Int) {
        print("현재 투입한 금액이 \(money)원입니다. 다음과 같은 음료가 있습니다.")
    }
    
    static func menu() {
        print("""
             1. 금액추가
             2. 음료구매
             """)
    }
    
    // 현재 보유 중인 음료수 내역
    func beverageList(_ beverage:VendingMachine) {
        let drinks = beverage.currentBeverageStatus()
        for inner in 0 ..< drinks.count {
            print("\(inner + 1)) \(drinks[inner].beverageName) \(drinks[inner].beveragaPrice)원 \(drinks[inner].beverageCount)개")
        }
    }
    
    // 음료 구매 후 출력문
    static func printPurchase(productName: String, price: Int) {
        print("\(productName)를 구매하셨습니다. \(price)원을 차감합니다.\n")
    }
    
    // 에러 출력
    func printError(_ error: InputError) {
            print(error.message())
    }
}



