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
    
    enum Art {
        case flower
        case heart
        case none
    }
    
    init(milk: Double, art: Art, caffeine: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.milk = milk
        self.art = art
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class Affogato: Coffee {
    private var iceCream: Flavor // 아이스크림 종류
    override var expire: Date {
        return Date(timeInterval: Date.convert(weeks: 2), since: super.expire)
    }
    
    enum Flavor {
        case vanilla
        case chocolate
        case caramel
    }
    
    init(iceCream: Flavor, caffeine: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.iceCream = iceCream
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, date: date)
    }
}
