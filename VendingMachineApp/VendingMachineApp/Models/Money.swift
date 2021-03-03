//
//  Money.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/03.
//

import Foundation

class Money {
    private (set) var property: Int
    
    init() {
        self.property = 0
    }
    
    func deposit(unit: Int) {
        property += unit
    }
    
    func withdrawl(unit: Int) {
        property -= unit
    }
}
