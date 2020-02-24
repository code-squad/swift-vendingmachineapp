//
//  Berverage.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

enum BeverageType: String {
    case coke = "Coke"
    case sprite = "Sprite"
    case cantata = "Cantata"
    case georgia = "Georgia"
    case chocolateMilk = "ChocolateMilk"
    case bananaMilk = "BananaMilk"
    
    init(of beverage: Beverage) {
        switch beverage {
        case is Coke:
            self = .coke
        case is Sprite:
            self = .sprite
        case is Cantata:
            self = .cantata
        case is Georgia:
            self = .georgia
        case is ChocolateMilk:
            self = .chocolateMilk
        default:
            self = .bananaMilk
        }
    }
}

class Beverage {
    let name: String
    let brand: String
    let servingSize: Int
    let price: Int
    let dateOfManufacture: Date
    
    init(name: String, brand: String, servingSize: Int, price: Int, dateOfManufacture: Date) {
        self.name = name
        self.brand = brand
        self.servingSize = servingSize
        self.price = price
        self.dateOfManufacture = dateOfManufacture
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(name), \(servingSize)ml, \(price)원"
    }
}
