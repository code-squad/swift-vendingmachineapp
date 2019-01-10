//
//  BeverageArchiveKey.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 10..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct BeverageArchiveKey {
    //MARK: - Beverage
    static let brand: String = "brand"
    static let size: String = "size"
    static let price: String = "price"
    static let name: String = "name"
    static let openDate: String = "openDate"
    static let expiryDate: String = "expiryDate"
    
    //MARK: - Milk
    static let lactose: String = "lactose"
    
    //MARK: - Coffee
    static let hasMilk: String = "hasMilk"
    static let isHot: String = "isHot"
    
    //MARK: - CarbonatedDrink
    static let calorie: String = "calorie"
}
