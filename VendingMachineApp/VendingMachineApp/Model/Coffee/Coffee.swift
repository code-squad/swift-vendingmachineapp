//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation

enum CoffeeBrandName {
    
    case Top
    case Cantata
    case Georgia
}

class Coffee : Drink {
    
    private var isCoffeeBrandName: CoffeeBrandName
    private var isDecaffeinated: Int
    
<<<<<<< HEAD
    init(isDecaffeinated: Int, isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date) {
        self.isCoffeeBrandName = isCoffeeBrandName
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, isHot: isHot)
=======
    init(isDecaffeinated: Int, isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.isCoffeeBrandName = isCoffeeBrandName
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate, isHot: isHot)
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
    }
    
    //MARK: 저지방음료 확인
    func isDecaffein() -> Bool {
        return isDecaffeinated > 50
    }

}


