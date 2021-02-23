//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Milk: Beverage {
    public enum FarmLocation {
        case domesticFarm
        case overseasFarm
    }
    private let isFrom: FarmLocation
    
    public init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, farmLocation: FarmLocation) {
        isFrom = farmLocation
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName)
    }
    
    convenience override init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName:itemName, farmLocation: .domesticFarm)
    }
}
