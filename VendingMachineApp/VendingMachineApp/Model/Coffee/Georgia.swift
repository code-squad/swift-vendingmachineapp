//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class Georgia: Coffee {
    
    private var isBlacked : Bool
    
<<<<<<< HEAD
    init(isBlacked: Bool, isDecaffeinated: Int,isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date) {
        self.isBlacked = isBlacked
        super.init(isDecaffeinated: isDecaffeinated,isHot: isHot, isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt)
=======
    init(isBlacked: Bool, isDecaffeinated: Int,isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.isBlacked = isBlacked
        super.init(isDecaffeinated: isDecaffeinated,isHot: isHot, isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
    }
}
