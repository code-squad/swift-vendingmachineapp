//
//  Money.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/03.
//

import Foundation

class Money {
    private var Money : Int
    
    init(money : Int) {
        self.Money = money
    }
    
    func addMoney(money : Money) -> Void{
        self.Money = money.Money
    }
    
    func canBuybeverage(price : Int) -> Bool{
        return self.Money > price
    }
}
