//
//  Soda.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Soda: Beverage {

    private var sugarContent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, sugarContent: Int) {
        self.sugarContent = sugarContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt)
    }
    
    func isUnsweetened() -> Bool {
        return sugarContent < 1 ? true : false
    }
}
