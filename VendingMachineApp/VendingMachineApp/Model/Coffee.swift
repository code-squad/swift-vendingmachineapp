//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Coffee: Beverage {
    private let beverageType: BeverageCategory
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        self.beverageType = .Coffee
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturedAt: Date())
    }
    
}


class TOP: Coffee {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "맥심", volume: 275, price: 900, name: "TOP", manufacturedAt: date)
    }
}

class Cantata: Coffee {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "롯데칠성", volume: 275, price: 1000, name: "칸타타", manufacturedAt: date)
    }
}

class Georgia: Coffee {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "코카콜라", volume: 240, price: 1000, name: "조지아", manufacturedAt: date)
    }
}
