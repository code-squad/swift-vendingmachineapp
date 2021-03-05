//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/26.
//

import Foundation

class Milk: Beverage {
    
    private var flavored: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.flavored = flavored
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
}

class SeoulSterilized: Milk {
    
    private var sterilized: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, sterilized: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.sterilized = sterilized
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, flavored: flavored, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 500, subbrand: "서울우유 멸균우유", flavored: false, sterilized: true, manufacturedAt: manufacturedAt, expiration: expiration, skuName: "서울우유 멸균우유 200ml 낱개")
    }
    
}

class SeoulStrawberry: Milk {
    
    private var fruity: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, manufacturedAt: Date, expiration: Date, fruity: Bool, skuName: String) {
        self.fruity = fruity
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, flavored: flavored, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 800, subbrand: "서울우유 딸기우유", flavored: true, manufacturedAt: manufacturedAt, expiration: expiration, fruity: true, skuName: "서울우유 딸기우유 200ml 낱개")
    }
    
}

class SeoulChoco: Milk {
    
    private var bitterSweet: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, manufacturedAt: Date, expiration: Date, bitterSweet: Bool, skuName: String) {
        self.bitterSweet = bitterSweet
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, flavored: flavored, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 800, subbrand: "서울우유 초코우유", flavored: true, manufacturedAt: manufacturedAt, expiration: expiration, bitterSweet: true, skuName: "서울우유 초코우유 200ml 낱개")
    }
    
}
