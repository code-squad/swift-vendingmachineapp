//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Milk : Beverage {
    private var lowfat : Bool
    private var taste : Taste
    
    enum Taste {
        case strawberry, chocolate
    }
    
    init(lowfat : Bool, brand: String, taste: Taste, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int) {
        self.lowfat = lowfat
        self.taste = taste
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal : kcal)
    }
    
    convenience init(taste: Taste, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int){ //저지방 우유
        self.init(lowfat : true, brand: brand, taste: taste, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal: kcal)
    }
}
