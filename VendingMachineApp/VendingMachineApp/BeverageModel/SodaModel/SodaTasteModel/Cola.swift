//
//  CocaCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Cola: Soda {
    public enum BottleType {
        case 알루미늄
        case 유리
        case 플라스틱
    }
    private let bottle: BottleType
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, isZeroCalories: Bool, bottleType: BottleType) {
        bottle = bottleType
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, isZeroCalories: isZeroCalories)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, isZeroCalories: false, bottleType: .알루미늄)
    }
}
