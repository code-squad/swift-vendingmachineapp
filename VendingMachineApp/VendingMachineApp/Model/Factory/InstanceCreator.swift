//
//  Factory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/12.
//

import Foundation

class InstanceCreator {
    
    static func createInstance(sku: Beverage.Type) -> Beverage? {
        return sku.init()
    }
    
}
