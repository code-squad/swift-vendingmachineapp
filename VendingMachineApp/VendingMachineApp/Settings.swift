//
//  Settings.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

struct Settings {
    
    static let moneyUnits = [1000, 5000, 10000]
    
    static let itemTypes: [Shopable.Type] = [Americano.self,
                                             CafeLatte.self,
                                             Chocolate.self,
                                             Coke.self,
                                             Milkis.self,
                                             Plain.self]
    
    enum Standards {
        static let temperature: Float = 36.5
        static let sugar: Float = 1.0
        static let lactose: Float = 3.5
    }
}
