//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Soda: Beverage {
    private var zeroCalories: Bool
   
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, isZeroCalories: Bool) {
        zeroCalories = isZeroCalories
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName)
    }
    
    convenience override init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, isZeroCalories: false)
    }
}
