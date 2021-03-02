//
//  Cider.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Cider: Soda {
    
    private var category: String
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, unsweetened: Bool) {
        self.category = "사이다"
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, unsweetened: unsweetened)
    }
}
