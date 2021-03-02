//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Milk: Beverage {
    private let beverageType: BeverageCategory
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.beverageType = .milk
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturingDate: Date())
    }
    
}


class StrawberryMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "서울우유", volume: 200, price: 1000, name: "딸기우유", manufacturingDate: date)
    }
}

class ChocoMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "서울우유", volume: 200, price: 1000, name: "초코우유", manufacturingDate: date)
    }
}

class BananaMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "서울우유", volume: 200, price: 1000, name: "바나나우유", manufacturingDate: date)
    }
}
