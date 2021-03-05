//
//  Cola.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

enum PackageType {
    case bottle
    case can
    case plastic
}

class Cola: Soda {
    
    private let packageType: PackageType
    
    init(packageType: PackageType, isSodaType: SodaType, factoryCode: String, brand: String, capacity: Int, price: Int, name: String,
         madeDate: Date,isHot:Bool) {
        self.packageType = packageType
        super.init(isSodaType: isSodaType, factoryCode: factoryCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot: isHot)
    }
}
