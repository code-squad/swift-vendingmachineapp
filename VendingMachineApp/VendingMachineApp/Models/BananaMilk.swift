//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

class BananaMilk: Beverage {
    
    private var flavor: String
    
    init(brand: String, weight: Int, price: Int, name: String, dateOfManufacture: Date, flavor: String) {
        self.flavor = flavor
        super.init(brand: brand, weight: weight, price: price, name: name, dateOfManufacture: dateOfManufacture)
        let bananaFlavor: String = flavor + "맛"
        apply(featureOfBeverage: [bananaFlavor])
    }
}
