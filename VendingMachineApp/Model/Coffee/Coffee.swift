//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Coffee : Beverage{
    private var caffeine : Int
    private let hot : Bool
    
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire: String, caffeine : Int, hot : Bool = false){
        self.caffeine = caffeine
        self.hot = hot
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   create: create,
                   expire: expire)
    }
    override var description: String {
        return super.description + ", \(caffeine)mg"
    }
    func isHot() -> Bool{
        return hot
    }
}
