//
//  Soda.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var sodium: Int // 나트륨함량 (mg)
    
    init(sodium: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.sodium = sodium
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.sodium = aDecoder.decodeInteger(forKey: "sodium")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.sodium, forKey: "sodium")
    }
    
    public func isLowSodium() -> Bool {
        return self.sodium <= 100 ? true : false
    }
}

class Coke: Soda {
    private var calorie: Int // 칼로리 (kcal)
    
    init(calorie: Int, sodium: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.calorie = calorie
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(calorie: 90, sodium: 200, brand: Brand.pepsi.description, capacity: 350, price: 1500, name: Product.dietCoke.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.pepsi.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.calorie = aDecoder.decodeInteger(forKey: "calorie")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.calorie, forKey: "calorie")
    }
    
    public func isLowCalorie() -> Bool {
        return self.calorie <= 100 ? true : false
    }
}

class Cider: Soda {
    private var transFat: Int // 트랜스지방 (g)
    
    init(transFat: Int, sodium: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.transFat = transFat
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(transFat: 0, sodium: 300, brand: Brand.lotteChilsung.description, capacity: 140, price: 1100, name: Product.chilsungCider.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.lotteChilsung.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.transFat = aDecoder.decodeInteger(forKey: "transFat")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(self.transFat, forKey: "transFat")
    }
    
    public func isNoneTransFat() -> Bool {
        return self.transFat == 0 ? true : false
    }
}

class Fanta: Soda {
    private var taste: FantaTaste // 색상 (pineapple , orange , grape , etc..)
    
    init(taste: FantaTaste, sodium: Int, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.taste = taste
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    convenience init(dateOfManufacture: Date) {
        self.init(taste: FantaTaste.orange, sodium: 100, brand: Brand.cocacola.description, capacity: 355, price: 900, name: Product.orangeFanta.description, dateOfManufacture: dateOfManufacture, manufacturer: Brand.cocacola.description)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let decoderTaste = aDecoder.decodeObject(forKey: "taste") as? String, let taste = FantaTaste(rawValue: decoderTaste) else {
            return nil
        }
        self.taste = taste
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        let taste = self.taste.rawValue
        aCoder.encode(taste, forKey: "taste")
    }
    
    public func isOrangeTaste() -> Bool {
        return self.taste == FantaTaste.orange ? true :false
    }
}
