//
//  Sprite.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {
    private var flavoringSyrups: String = "레몬라임향"
    convenience init() {
        self.init(brand: "", weight: 0, price: 2000, name: "", manufactureDate: Date(), flavoringSyrups: "")
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, flavoringSyrups: String) {
        self.flavoringSyrups = flavoringSyrups
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "사이다"
    }
    required init?(coder aDecoder: NSCoder) {
        flavoringSyrups = (aDecoder.decodeObject(forKey: "flavoringSyrups") as? String) ?? ""
        super.init(coder: aDecoder)
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(flavoringSyrups, forKey: "flavoringSyrups")
    }
    
    func isLemonLimeFlavor() -> Bool {
        return (self.flavoringSyrups == "레몬라임향")
    }
}
