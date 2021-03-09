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
    
    init(isDecaffeinated: Int, isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date) {
        self.isCoffeeBrandName = isCoffeeBrandName
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt, isHot: isHot)
    }
    
    //MARK: 저지방음료 확인
    func isDecaffein() -> Bool {
        return isDecaffeinated > 50
    }

}


