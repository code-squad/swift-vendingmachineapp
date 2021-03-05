//
//  Soda.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation

enum SodaType  {
    case Cola
    case Sprite
    case Fanta
}

class Soda :Drink {
    
    private var factoryCode: String
    private var isSodaType: SodaType
    
    init(isSodaType:SodaType, factoryCode:String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool) {
        self.factoryCode = factoryCode
        self.isSodaType = isSodaType
        super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate, isHot: isHot)
    }
}
