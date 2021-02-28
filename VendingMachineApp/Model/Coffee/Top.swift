//
//  Top.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class Top : Coffee {

    init(create : String, expire : String, hot : Bool = false){
        super.init(brand: "맥심",
                   capacity: 275,
                   price: 1700,
                   name: "맥심TOP",
                   create: create,
                   expire: expire,
                   caffeine: 100,
                   hot: hot)
    }
}
