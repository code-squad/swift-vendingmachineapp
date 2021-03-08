//
//  ChocoMilk.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/04.
//

import Foundation

final class ChocoMilk: Milk {
    enum Flavor {
        case original
        case cookiesAndCream
    }
    
    private let flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, expireDate: String, caffeineContent: Int, milkFarmCode: String, chocoFlavor: Flavor) {
        self.flavor = chocoFlavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, expireDate: expireDate, caffeineContent: caffeineContent, milkFarmCode: milkFarmCode)
    }
    
    convenience init(expireDate: String) {
        self.init(
            brand: "매일유업",
            capacity: 235,
            price: 1000,
            name: "허쉬초콜릿드링크",
            expireDate: expireDate,
            caffeineContent: 0,
            milkFarmCode: "BS024",
            chocoFlavor: Flavor.original
        )
    }
}
