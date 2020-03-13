//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation
class Coffee: Beverage {
    private var package: Packages
    let packageString = "package"
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date,  package: Packages, temperature: Int) {
        self.package = package
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }
    
    enum Packages: String {
        case glass = "glass"
        case can = "can"
        case plastic = "plastic"
    }
    
    required init?(coder: NSCoder) {
        let decodedString = coder.decodeObject(forKey: packageString) as? String
        let package = Packages(rawValue: decodedString ?? "" )
        self.package = package ?? Packages.glass
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.package.rawValue, forKey: packageString)
    }
    
}
