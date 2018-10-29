//
//  Alcohol.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Alcohol: Beverage {
    private var alcohol: Double // 알코올 도수
    var isNonAlcohol: Bool {
        return alcohol == 0
    }
    
    init(alcohol: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.alcohol = alcohol
        super.init(brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class Beer: Alcohol {
    private var malt: Double // 맥아 비율
    override var expire: Date {
        return Date(timeInterval: Date.convert(years: 1), since: super.expire)
    }
    var bitterness: Double {
        return malt * 100 / 1.23 // 임의식
    }
    
    init(malt: Double, alcohol: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.malt = malt
        super.init(alcohol: alcohol, brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class RiceWine: Alcohol {
    private var area: Area
    override var expire: Date {
        return Date(timeInterval: Date.convert(weeks: 2), since: super.expire)
    }
    var isSeoulRiceWine: Bool {
        return area == .seoul
    }
    enum Area {
        case seoul
        case busan
        case jeju
        case gwangju
    }
    
    init(area: Area, alcohol: Double, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.area = area
        super.init(alcohol: alcohol, brand: brand, volume: volume, price: price, name: name, date: date)
    }
}
