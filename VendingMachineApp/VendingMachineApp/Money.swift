//
//  Money.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/03.
//

import Foundation

class Money {
    private var Money : Int
    
    init() {
        Money = 0
    }
    
    func addMoney(money : Money) -> Void{
        self.Money = money.Money
    }
    
    func currentMoney() -> Int{
        return Money
    }
}
