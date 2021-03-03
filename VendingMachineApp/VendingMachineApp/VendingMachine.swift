//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var money : Money
    private var milk : [Milk]
    private var soda : [Soda]
    private var energydrink : [Energydrink]
    private var coffee : [Coffee]
    
    init(Money : Money){
        self.money = Money
        self.milk = []
        self.soda = []
        self.energydrink = []
        self.coffee = []
    }
}
