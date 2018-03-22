//
//  Soda.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var saccharide: Int = 27
    override init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, imageName: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate, imageName: imageName)
        super.kindOf = "탄산"
    }
    required init?(coder aDecoder: NSCoder) {
        saccharide = aDecoder.decodeInteger(forKey: "saccharide")
        super.init()
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(saccharide, forKey: "saccharide")
    }
    
    override var description: String {
        return " - \(super.description)"
    }
    
    var descriptionDetail: String {
        return "\(self.kindOf)(\(type(of: self)))\(super.description)"
    }
    
    func isSweet() -> Bool {
        return (self.saccharide > 25)
    }
    
    func isModerateSaccharide() -> Bool {
        return saccharide == 27
    }

}
