//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class BananaMilk: Milk {

    private let bananaContent : Float
    
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire : String, content : Float){
        self.bananaContent = content
        super.init(brand: brand, capacity: capacity, price: price, name: name, create: create, expire: expire)
    }
    override var description: String {
        return super.description + ", (\(bananaContent)%)"
    }
}
