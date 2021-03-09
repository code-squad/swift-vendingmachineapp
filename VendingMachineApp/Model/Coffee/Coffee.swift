//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation
import UIKit

class Coffee : Beverage{
    private var caffeine : Int
    private let hot : Bool
    
    init(brand : String, capacity : Int, price : Int, name : String, createdAt : String, expiredAt: String, caffeine : Int, hot : Bool){
        self.caffeine = caffeine
        self.hot = hot
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt)
    }
    override var description: String {
        return super.description + ", \(caffeine)mg"
    }
    func isHot() -> Bool{
        return hot
    }
}
