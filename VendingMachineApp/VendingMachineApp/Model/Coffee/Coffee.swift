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
    private var isDecaffeinated: Bool
    
    init(isDecaffeinated: Bool, isHot:Bool, isCoffeeBrandName: CoffeeBrandName, brand: String, capacity: Int, price: Int, name: String, madeDate: Date, beverageType:BeverageType) {
        self.isCoffeeBrandName = isCoffeeBrandName
        self.isDecaffeinated = isDecaffeinated
        super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate, isHot: isHot, beverageType: BeverageType.Coffee)
    }
    
    //MARK: 저지방음료 확인
    func isLowCalorie() -> Bool {
        return isDecaffeinated
    }
    
    
}


