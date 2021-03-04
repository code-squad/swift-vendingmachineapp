//
//  Amount.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/03.
//

import Foundation

class Money {
    
    private var inputAmount: Int
    
    init() {
        self.inputAmount = 0
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
    
    // 금액 비교 메소드
    func comparePrice(commodityPrice: Int) -> Bool {
        return inputAmount >= commodityPrice
    }
}

extension Money {
    static func == (lhs: Money, rhs: Money) -> Bool {
        return lhs.inputAmount == rhs.inputAmount
    }
}
