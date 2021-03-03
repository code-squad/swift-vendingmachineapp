//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Soda: Beverage {
    private let beverageType: BeverageCategory
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        self.beverageType = .Soda
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturedAt: Date())
    }
    
}


class Cola: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "펩시코", volume: 355, price: 500, name: "펩시", manufacturedAt: date)
    }
}

class Cider: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "코카콜라", volume: 185, price: 1000, name: "스프라이트", manufacturedAt: date)
    }
}

class Fanta: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "코카콜라", volume: 355, price: 800, name: "환타", manufacturedAt: date)
    }
}
