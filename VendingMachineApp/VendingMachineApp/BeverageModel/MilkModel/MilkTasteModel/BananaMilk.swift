//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class BananaMilk: Milk {
    private let usageOfColoring: Bool
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, farmLocation: Milk.FarmLocation, coloring: Bool) {
        usageOfColoring = coloring
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, farmLocation: farmLocation)
    }
    
    convenience init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, farmLocation: .domesticFarm, coloring: true)
    }
}
