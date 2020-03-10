//
//  Top.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class Top: ElementsOfBeverage {

    private var coffeeVarieties: String
    
    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, coffeeVarieties: String) {
        self.coffeeVarieties = coffeeVarieties
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
        apply(featureOfBeverage: [coffeeVarieties])
    }
}


