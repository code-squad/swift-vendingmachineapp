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
    
    init(manufacturer: String, brand: String, capacity: Int, price: Money, name: String, manufacturedDate: Date, expirationDate: Date,  package: Packages, temperature: Int) {
        self.package = package
        super.init(manufacturer: manufacturer, brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expirationDate: expirationDate, temperature: temperature)
    }
    
    enum Packages{
        case glass
        case can
        case plastic
    }
    
    required init?(coder: NSCoder) {
       guard let package = coder.decodeObject(forKey: "package") as? Packages else { return nil }
        self.package = package
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(self.package, forKey: "package")
    }
    
}
