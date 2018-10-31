//
//  Coffee.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var caffeine: Double // 카페인 함량
    var isDecaffeine: Bool {
        return caffeine < 0.1
    }
    
    init(caffeine: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        caffeine = aDecoder.decodeDouble(forKey: "caffeine")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(caffeine, forKey: "caffeine")
    }
}

class Latte: Coffee {
    private var milk: Double
    private var art: Art
    override var expire: Date {
        return Date(timeInterval: Date.convert(weeks: 1), since: super.expire)
    }
    var hasArt: Bool {
        return self.art != .none
    }
    
    enum Art: String {
        case flower
        case heart
        case none
    }
    
    init(milk: Double, art: Art, caffeine: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.milk = milk
        self.art = art
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        milk = aDecoder.decodeDouble(forKey: "milk")
        let rawValue = aDecoder.decodeObject(forKey: "art") as! String
        art = Art(rawValue: rawValue)!
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(milk, forKey: "milk")
        aCoder.encode(art.rawValue, forKey: "art")
    }
}

class Affogato: Coffee {
    private var iceCream: Flavor // 아이스크림 종류
    override var expire: Date {
        return Date(timeInterval: Date.convert(weeks: 2), since: super.expire)
    }
    
    enum Flavor: String {
        case vanilla
        case chocolate
        case caramel
    }
    
    init(iceCream: Flavor, caffeine: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.iceCream = iceCream
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        let rawValue = aDecoder.decodeObject(forKey: "iceCream") as! String
        iceCream = Flavor(rawValue: rawValue)!
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(iceCream.rawValue, forKey: "iceCream")
    }
}
