//
//  Top.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class Top: Coffee {
    
    override init(isDecaffeinated: Bool,isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date, beverageType:BeverageType) {
        super.init(isDecaffeinated: isDecaffeinated,isHot: isHot, isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate, beverageType: BeverageType.Coffee)
    }
}
