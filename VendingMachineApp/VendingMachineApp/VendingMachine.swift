//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class VendingMachine: OutputViewPrintable {
    private let products: [Beverage]
    
    init(products: [Beverage]) {
        self.products = products
    }
    
    func printBeverage(handler: (Beverage) -> ()) {
        products.forEach {
            handler($0)
        }
    }
}
