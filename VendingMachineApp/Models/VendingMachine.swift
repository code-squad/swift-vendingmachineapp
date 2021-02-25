//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class VendingMachine {
    private var products = [Beverage]()
    
    public func append(drink : Beverage) {
        products.append(drink)
    }
    public func showElements(){
        print(products)
    }
}
