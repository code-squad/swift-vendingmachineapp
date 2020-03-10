//
//  Cola.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Cola: Beverage {
    
    private var pondusHydrogenii: Double
    
    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, pondusHydrogenii: Double) {
        self.pondusHydrogenii = pondusHydrogenii
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
        let carbonicAcidRatio: String = String(pondusHydrogenii) + "%"
        apply(featureOfBeverage: [carbonicAcidRatio])
    }
}



