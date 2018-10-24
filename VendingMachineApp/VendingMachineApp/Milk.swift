//
//  Milk.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var fat: Double // 지방함량 (%)
    
    init(fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.fat = fat
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.fat = aDecoder.decodeDouble(forKey: "fat")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.fat, forKey: "fat")
    }
    
    public func isLowFat() -> Bool {
        return self.fat <= 0.3 ? true : false
    }
}

class StrawberryMilk: Milk {
    private var flavor: Flavor // 향 (풍미)
    
    init(flavor: Flavor, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.flavor = flavor
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(flavor: Flavor.light, fat: 0.2, brand: Brand.maeil.description, capacity: 125, price: 1200, name: Product.organicStrawberryMilk.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.maeil.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decoderFlavor = aDecoder.decodeObject(forKey: "flavor") as? String, let flavor = Flavor(rawValue: decoderFlavor) else {
            return nil
        }
        self.flavor = flavor
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        let flavor = self.flavor.rawValue
        aCoder.encode(flavor, forKey: "flavor")
    }
    
    public func isNoneFlavor() -> Bool {
        return self.flavor == Flavor.none ? true : false
    }
}

class ChocolateMilk: Milk {
    private var concentration: Double // 농도 (%)
    
    init(concentration: Double, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.concentration = concentration
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(concentration: 0.1, fat: 0.7, brand: Brand.seoulMilk.description, capacity: 200, price: 900, name: Product.seoulChocoMilk.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.seoulMilk.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.concentration = aDecoder.decodeDouble(forKey: "concentration")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.concentration, forKey: "concentration")
    }
    
    public func isLowConcentration() -> Bool {
        return self.concentration <= 0.3 ? true : false
    }
}

class BananaMilk: Milk {
    private var color: BananaMilkColor // 색상 (yellow , light yellow , white , etc..)
    
    init(color: BananaMilkColor, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.color = color
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(color: BananaMilkColor.white, fat: 0.4, brand: Brand.maeil.description, capacity: 240, price: 1500, name: Product.bananasAreNaturallyWhite.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.maeil.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decoderColor = aDecoder.decodeObject(forKey: "color") as? String, let color = BananaMilkColor(rawValue: decoderColor) else {
            return nil
        }
        self.color = color
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        let color = self.color.rawValue
        aCoder.encode(color, forKey: "color")
    }
    
    public func isWhiteColor() -> Bool {
        return self.color == BananaMilkColor.white ? true : false
    }
}
