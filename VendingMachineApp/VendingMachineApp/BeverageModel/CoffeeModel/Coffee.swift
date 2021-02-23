//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Coffee: Beverage {
    public enum CoffeeBean {
        case 아라비카원두
        case 로부스타원두
    }
    private let bean: CoffeeBean
    
    init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, coffeeBean: CoffeeBean) {
        bean = coffeeBean
        super.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName)
    }
    
    convenience override init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String) {
        self.init(brandName: brandName, sizeInMilliliter: sizeInMilliliter, itemPrice: itemPrice, itemName: itemName, coffeeBean: .로부스타원두)
    }
}
