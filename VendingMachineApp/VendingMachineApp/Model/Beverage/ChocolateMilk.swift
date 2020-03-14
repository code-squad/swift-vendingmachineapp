//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/25.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    enum Package: String {
        case plastic = "plastic"
        case paper = "paper"
        case vinyl = "vinyl"
    }
    
    private var package: Package
    
    init(brand: String, capacity: Int, price: Price, name: String, manufacturingDate: Date, calorie: Double, temperature: Temperature, farmCode: FarmCode, package: Package) {
        self.package = package
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturingDate: manufacturingDate, calorie: calorie, temperature: temperature, farmCode: farmCode)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(package.rawValue, forKey: Property.package)
        super.encode(with: coder)
    }
    
    required init?(coder decoder: NSCoder) {
        let material = decoder.decodeObject(forKey: Property.package) as? String ?? "plastic"
        self.package = Package.init(rawValue: material) ?? Package.plastic
        
        super.init(coder: decoder)
    }
    
    func isSamePackage(as package: Package) -> Bool {
        return self.package == package
    }
}
