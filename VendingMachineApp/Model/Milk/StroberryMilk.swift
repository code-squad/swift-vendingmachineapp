//
//  StroberryMilk.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class StroberryMilk : Milk {
    private let stroberryContent : Float
    
    init(brand : String, capacity : Int, price : Int, name : String, create : String, expire : String, content : Float){
        self.stroberryContent = content
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   create: create,
                   expire: expire)
    }
    override var description: String {
        return super.description + ", (\(stroberryContent)%)"
    }
}
