//
//  Top.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Top: ElementsOfBeverage {
    
    private var cacao: Double
    
    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, cacao: Double) {
        self.cacao = cacao
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
        let cacaoRatio = String(cacao) + "%"
        apply(featureOfBeverage: [cacaoRatio])
    }
}


