//
//  Amount.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/03.
//

import Foundation

class Money {
    
    private var inputAmount: Int
    
    init(inputAmount: Int) {
        self.inputAmount = inputAmount
    }
    
    // 금액을 올리는 메소드
    func increaseAmount(additionalAmount: Int)  {
        inputAmount += additionalAmount
    }
    
    func decreaseAmount(price: Int) {
       inputAmount -= price
    } 
    
    // 잔액을 확인하는 메소드
    func showCurrentAmount() -> Int {
        return inputAmount
    }
    
    func checkAvailability(beverage: Beverage) -> Bool {
        return beverage.availableBeverage(currentAmount: self.inputAmount)
    }
    
}

extension Money: Equatable {
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.inputAmount == rhs.inputAmount
    }
}
