//
//  Coke.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Coke : Soda{
    let product : Product
    
    enum Product {
        case light, zero
    }
    init(product : Product, sugar: Bool, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.product = product
        super.init(sugar: sugar, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    override func addtoVendingMachine(vendingMachine: VendingMachine) {
        vendingMachine.addCoke(coke: self)
    }
}
