//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var caffeine: Int // 카페인함량 (mg)
    
    init(caffeine: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.caffeine = caffeine
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.caffeine = aDecoder.decodeInteger(forKey: "caffeine")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.caffeine, forKey: "caffeine")
    }
    
    public func isNoneCaffeine() -> Bool {
        return self.caffeine == 0 ? true : false
    }
}

class TOP: Coffee {
    private var hot: Bool // 뜨거움 여부
    
    init(hot: Bool, caffeine: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.hot = hot
        super.init(caffeine: caffeine, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(hot: true, caffeine: 120, brand: Brand.maxim.description, capacity: 275, price: 1800, name: Product.topCoffee.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.maxim.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.hot = aDecoder.decodeBool(forKey: "hot")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.hot, forKey: "hot")
    }
    
    public func isHot() -> Bool {
        return self.hot
    }
}

class Cantata: Coffee {
    private var sugarFree: Bool // 무가당여부
    
    init(sugarFree: Bool, caffeine: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.sugarFree = sugarFree
        super.init(caffeine: caffeine, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(sugarFree: true, caffeine: 100, brand: Brand.lotteChilsung.description, capacity: 275, price: 1400, name: Product.cantataCoffee.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.lotteChilsung.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.sugarFree = aDecoder.decodeBool(forKey: "sugarFree")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.sugarFree, forKey: "sugarFree")
    }
    
    public func isSugarFree() -> Bool {
        return self.sugarFree
    }
}

class Georgia: Coffee {
    private var packageMaterial: Material // 패키지재질 ( Can , Plastic , Glass , etc..)

    init(packageMaterial: Material, caffeine: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.packageMaterial = packageMaterial
        super.init(caffeine: caffeine, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(packageMaterial: Material.can, caffeine: 80, brand: Brand.cocacola.description, capacity: 240, price: 1800, name: Product.georgiaCoffee.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.cocacola.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decoderPackageMaterial = aDecoder.decodeObject(forKey: "packageMaterial") as? String, let packageMaterial = Material(rawValue: decoderPackageMaterial) else {
            return nil
        }
        self.packageMaterial = packageMaterial
        
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        
        let packageMaterial = self.packageMaterial.rawValue
        aCoder.encode(packageMaterial, forKey: "packageMaterial")
    }
    
    public func isCan() -> Bool {
        return self.packageMaterial == Material.can ? true : false
    }
}
