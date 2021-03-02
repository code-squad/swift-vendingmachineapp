//
//  Money.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/02.
//

import Foundation

class Money {
    private(set) var money: Int
    
    init(with money: Int) {
        self.money = money
    }
    
    func changeMoney(with money: Int) {
        self.money += money
    }
    
    func checkChange() -> Money{
        return self
    }
}
