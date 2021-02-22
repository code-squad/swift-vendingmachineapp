//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Coffee: Beverage {
    public enum CoffeeCategory{
        case TOP
        case 칸타타
        case 조지아
    }
    private let coffeeBrand: CoffeeCategory
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date, coffeeCategory: CoffeeCategory) {
        coffeeBrand = coffeeCategory
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: manufacturingDate)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, coffeeCategory: CoffeeCategory) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: Date(), coffeeCategory: coffeeCategory)
    }
}
