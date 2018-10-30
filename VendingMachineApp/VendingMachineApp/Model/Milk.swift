//
//  Milk.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var fat: Double // 지방 함량
    private var code: String // 목장 코드
    override var expire: Date {
        return Date(timeInterval: Date.convert(weeks: 1), since: super.expire)
    }
    var isLowFat: Bool {
        return fat < 0.2
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(fat, forKey: "fat")
        aCoder.encode(code, forKey: "code")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fat = aDecoder.decodeDouble(forKey: "fat")
        code = aDecoder.decodeObject(forKey: "code") as! String
        super.init(coder: aDecoder)
    }
    
    init(fat: Double, code: String, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.fat = fat
        self.code = code
        super.init(brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class FruitMilk: Milk {
    private var fruit: Fruit // 과일 종류
    enum Fruit: String {
        case strawberry
        case banana
        case melon
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(fruit.rawValue, forKey: "fruit")
    }
    
    required init?(coder aDecoder: NSCoder) {
        let rawValue = aDecoder.decodeObject(forKey: "fruit") as! String
        fruit = Fruit(rawValue: rawValue)!
        super.init(coder: aDecoder)
    }
    
    init(fruit: Fruit, fat: Double, code: String, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.fruit = fruit
        super.init(fat: fat, code: code, brand: brand, volume: volume, price: price, name: name, date: date)
    }
}

class ChocolateMilk: Milk {
    private var chocolate: Double // 초콜릿 함량
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(chocolate, forKey: "chocolate")
    }
    
    required init?(coder aDecoder: NSCoder) {
        chocolate = aDecoder.decodeDouble(forKey: "chocolate")
        super.init(coder: aDecoder)
    }
    
    init(chocolate: Double, fat: Double, code: String, brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.chocolate = chocolate
        super.init(fat: fat, code: code, brand: brand, volume: volume, price: price, name: name, date: date)
    }
}
