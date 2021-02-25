//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private let stock: Stock
    
    init() {
        stock = Stock()
    }
    
    func add(beverage: Beverage){
        stock.add(beverage: beverage)
    }
    
    func showStock() {
        stock.show { print($0) }
    }
}


