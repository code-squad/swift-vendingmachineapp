//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Soda: Beverage {
    public enum SodaCategory {
        case 콜라
        case 사이다
        case 환타
    }
    private let taste: SodaCategory
   
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date, sodaCategory: SodaCategory) {
        taste = sodaCategory
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: manufacturingDate)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, sodaCategory: SodaCategory) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, manufacturingDate: Date(), sodaCategory: sodaCategory)
    }
}
