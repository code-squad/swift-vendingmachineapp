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
    
    private var flavor: Flavor
    
    init(flavor: Flavor, manufactured: Date) {
        self.flavor = flavor
        
        super.init(brand: "StarBucks",
                   capacity: 240,
                   price: 1150,
                   name: "StarBucks Cold Brew",
                   caffeineContent: 80,
                   manufactured: manufactured)
    }
    
    convenience init() {
        self.init(flavor: .black, manufactured: Date())
    }
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 180, compareDate: date)
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}
