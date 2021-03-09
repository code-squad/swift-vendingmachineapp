//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation


class sprite: Soda {
    
    private let inPlastic: Bool
    
<<<<<<< HEAD
    init(inPlastic: Bool, isSodaType: SodaType, factoryCode: String, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date,isHot:Bool) {
        self.inPlastic = inPlastic
        super.init(isSodaType: isSodaType, factoryCode: factoryCode, brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt,isHot: isHot)
=======
    init(inPlastic: Bool, isSodaType: SodaType, factoryCode: String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool) {
        self.inPlastic = inPlastic
        super.init(isSodaType: isSodaType, factoryCode: factoryCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot: isHot)
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
    }
    
}
