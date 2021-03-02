//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

class Soda: Beverage {
    private let beverageType: BeverageCategory
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.beverageType = .Soda
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturingDate: Date())
    }
    
}


class Cola: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "펩시코", volume: 355, price: 500, name: "펩시", manufacturingDate: date)
    }
}

class Cider: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "코카콜라", volume: 185, price: 1000, name: "스프라이트", manufacturingDate: date)
    }
}

class Fanta: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "코카콜라", volume: 355, price: 800, name: "환타", manufacturingDate: date)
    }
}
