//
//  StarbucksColdBrew.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

class StarbucksColdBrew: Coffee, Productization {
    enum Flavor: String {
        case black = "Black"
        case withMilk = "With Milk"
    }
    
    private(set) var flavor: Flavor
    
    init(flavor: Flavor, manufacture: Date = Date()) {
        self.flavor = flavor
        
        super.init(brand: "StarBucks",
                   capacity: 240,
                   price: 1150,
                   name: "StarBucks Cold Brew \(self.flavor.rawValue)",
                   isDecaffeinated: false,
                   manufacture: manufacture)
    }
    
    func validate(with date: Date) -> Bool {
        return manufacture - 180 < date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}
