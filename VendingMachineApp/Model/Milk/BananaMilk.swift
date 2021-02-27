//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class BananaMilk: Milk {

    private let bananaContent : Float
    
    init(create : String, expire : String){
        self.bananaContent = 1.0
        super.init(brand: "서울우유",
                   capacity: 200,
                   price: 900,
                   name: "바나나맛 우유",
                   create: create,
                   expire: expire)
    }
    override var description: String {
        return super.description + ", (\(bananaContent)%)"
    }
}
