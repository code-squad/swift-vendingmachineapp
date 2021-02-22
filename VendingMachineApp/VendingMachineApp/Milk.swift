//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Milk: Beverage {
    public enum MilkCategory {
        case 딸기우유
        case 초코우유
        case 바나나우유
    }
    
    private let category: MilkCategory
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date, milkCategory: MilkCategory) {
        category = milkCategory
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: manufacturingDate)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, milkCategory: MilkCategory) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: Date(), milkCategory: milkCategory)
    }
}
