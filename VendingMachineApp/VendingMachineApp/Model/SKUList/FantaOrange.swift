//
//  FantaOrange.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class FantaOrange: Soda {
    
    private var carbohydrateContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, sugarContent: Int, flavour: String, manufacturedAt: Date, expiration: Date, carbohydrateContent: Int, skuName: String) {
        self.carbohydrateContent = carbohydrateContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, sugarContent: sugarContent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "CocaCola", volume: 355, price: 1300, subbrand: "환타 오렌지맛", sugarContent: 41, flavour: "Orange", manufacturedAt: manufacturedAt, expiration: expiration, carbohydrateContent: 39, skuName: "환타 오렌지맛 355ml 낱개")
    }
    
}
