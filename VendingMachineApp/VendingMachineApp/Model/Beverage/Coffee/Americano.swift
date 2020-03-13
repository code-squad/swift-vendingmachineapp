//
//  Americano.swift
//  VendingMachineApp
//
//  Created by delma on 04/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Americano: Coffee {
    private var coffeeBean: String
    let coffeeBeanString = "coffeeBean"
    
    init(manufacturer: String = "", brand: String = "", capacity: Int = 0, price: Money = Money(), name: String = "", manufacturedDate: Date = Date(), expirationDate: Date = Date(), package: Packages = .can, temperature: Int = 0, coffeeBean: String = "") {
        self.coffeeBean = coffeeBean
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, package: package, temperature: temperature)
        
    }
    
    required init?(coder: NSCoder) {
        let coffeeBean = coder.decodeObject(forKey: coffeeBeanString) as? String
        self.coffeeBean = coffeeBean ?? ""
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.coffeeBean, forKey: coffeeBeanString)
    }
}
