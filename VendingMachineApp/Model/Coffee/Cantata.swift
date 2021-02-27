//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Cantata : Coffee {
    init(create : String, expire : String, hot : Bool = false){
        super.init(brand: "롯데칠성음료", capacity: 275, price: 1000, name: "칸타타", create: create, expire: expire, caffeine: 100, hot: hot)
    }
}
