//
//  PepsiCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Fanta: Soda {
    private let isFantastic: Bool

    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, isZeroCalories: Bool, isUsingNaturalFruit: Bool) {
        isFantastic = isUsingNaturalFruit
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, isZeroCalories: isZeroCalories)
    }

    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, isZeroCalories: false, isUsingNaturalFruit: true)
    }
}
