//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class VendingMachine {
    
    private var beverages: Beverages
    private var currentAmount: Int = 0
    
    init(beverages: Beverages) {
        self.beverages = beverages
    }
    
    // 재고를 추가하는 메소드
    func addStock(beverage: Beverage) {
        beverages.addBeverage(beverage: beverage)
    }
    
    // 금액을 올리는 메소드
    func IncreaseAmount(additionalAmount: Int)  {
        currentAmount += additionalAmount
    }
    
    // 잔액을 확인하는 메소드
    func showCurrentAmount() -> Int {
        return currentAmount
    }
}
