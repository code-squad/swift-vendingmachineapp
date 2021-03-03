//
//  Energydrink.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Energydrink : Beverage {
    private var caffeine : Bool
    private var kcal : Int
    private var flavor : Flavor
    
    enum Flavor {
        case monster, diablo
    }
    
    init(caffeine : Bool, kcal : Int, flavor: Flavor, brand: String, volume: Int, price: Int, name: String, manufactured: Date){
        self.caffeine = caffeine
        self.kcal = kcal
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    convenience init(kcal : Int, flavor: Flavor, brand: String, volume: Int, price: Int, name: String, manufactured: Date){ //카페인 있는 에너지 드링크
        self.init(caffeine: true, kcal: kcal, flavor: flavor, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured)
    }
    
    override var description: String{
        return super.description + ", \(flavor)맛 \(kcal)kcal, \(caffeine)"
    }
}
