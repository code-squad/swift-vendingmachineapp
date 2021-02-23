//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class StrawBerryMilk: Milk {
    private let containingRealStrawBerry: Bool
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, farmLocation: Milk.FarmLocation, actualStrawBerry: Bool) {
        containingRealStrawBerry = actualStrawBerry
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, farmLocation: farmLocation)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, farmLocation: .domesticFarm, actualStrawBerry: true)
    }
}
