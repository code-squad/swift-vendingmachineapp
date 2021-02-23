//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Americano: Coffee {
    private let isHighCaffeine: Bool
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, coffeeBean: CoffeeBean, caffeine: Int) {
        isHighCaffeine = (caffeine > 150)
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, coffeeBean: coffeeBean)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, caffeine: Int) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, coffeeBean: .로부스타원두, caffeine: caffeine)
    }
}
