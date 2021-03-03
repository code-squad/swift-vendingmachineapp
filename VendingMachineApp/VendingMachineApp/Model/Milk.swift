//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Milk: Beverage {
    private let beverageType: BeverageCategory
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        self.beverageType = .Milk
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturedAt: Date())
    }
    
}


class StrawberryMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "서울우유", volume: 200, price: 600, name: "딸기우유", manufacturedAt: date)
    }
}

class ChocoMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "서울우유", volume: 200, price: 600, name: "초코우유", manufacturedAt: date)
    }
}

class BananaMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "서울우유", volume: 200, price: 600, name: "바나나우유", manufacturedAt: date)
    }
}
