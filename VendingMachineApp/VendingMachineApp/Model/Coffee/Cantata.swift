//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    
    private var isPremium: Bool
    
<<<<<<< HEAD
    init(isPremium: Bool, isDecaffeinated: Int,isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date) {
        self.isPremium = isPremium
        super.init(isDecaffeinated: isDecaffeinated,isHot: isHot, isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt)
=======
    init(isPremium: Bool, isDecaffeinated: Int,isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.isPremium = isPremium
        super.init(isDecaffeinated: isDecaffeinated,isHot: isHot, isCoffeeBrandName: isCoffeeBrandName, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
    }
}
