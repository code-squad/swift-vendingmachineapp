//
//  Cola.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation


class Cola: Soda {
    
    private let inBottle: Bool
    
    init(inBottle: Bool, isSodaType: SodaType, factoryCode: String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.inBottle = inBottle
        super.init(isSodaType: isSodaType, factoryCode: factoryCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
    }
}
