//
//  Espresso.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class CaffeLatte: Coffee {
    private let withSteam: Bool
    private let withSugar: Bool
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date, coffeeBean: CoffeeBean, steam: Bool, sugar: Bool) {
        withSteam = steam
        withSugar = sugar
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: manufacturingDate, coffeeBean: coffeeBean)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date, steam: Bool, sugar: Bool) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName,manufacturingDate: manufacturingDate, coffeeBean: .로부스타원두, steam: steam, sugar: sugar)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: manufacturingDate, coffeeBean: .로부스타원두, steam: true, sugar: true)
    }
}
