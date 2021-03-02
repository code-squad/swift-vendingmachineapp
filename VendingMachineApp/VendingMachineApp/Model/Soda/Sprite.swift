//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation


class sprite: Soda {
    
    private let inPlastic: Bool
    
    init(inPlastic: Bool, isSodaType: SodaType, factoryCode: String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool, beverageType:BeverageType) {
        self.inPlastic = inPlastic
        super.init(isSodaType: isSodaType, factoryCode: factoryCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot: isHot, beverageType: BeverageType.Soda)
    }
    
}
