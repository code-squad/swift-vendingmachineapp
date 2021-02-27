//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Georgia : Coffee {
    init(create : String, expire : String, hot : Bool = false){
        super.init(brand: "조지아", capacity: 275, price: 1000, name: "조지아오리지널", create: create, expire: expire, caffeine: 100, hot: hot)
    }
}
