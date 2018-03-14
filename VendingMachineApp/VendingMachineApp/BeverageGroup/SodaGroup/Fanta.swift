//
//  Fanta.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Fanta: Soda {
    private var materials: String = "Aluminum"
    convenience init() {
        self.init(brand: "", weight: 0, price: 0, name: "", manufactureDate: Date(), materials: "")
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, materials: String) {
        self.materials = materials
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "환타"
    }
    required init?(coder aDecoder: NSCoder) {
        materials = (aDecoder.decodeObject(forKey: "materials") as? String) ?? ""
        super.init(coder: aDecoder)
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(materials, forKey: "materials")
    }
    
    func isAluminumCan() -> Bool {
        return self.materials == "Aluminum"
    }
}
