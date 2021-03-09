//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation
import UIKit

class BananaMilk: Milk {

    private let bananaContent : Float
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, lowFat : Bool, content : Float){
        self.bananaContent = content
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   lowFat: lowFat)
        
    }
    
    convenience required init() {
        self.init(brand: "서울우유",
                   capacity: 200,
                   price: 900,
                   name: "바나나맛 우유",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   lowFat : false,
                   content : 1.0)
    }
    
    override var description: String {
        return super.description + ", (\(bananaContent)%)"
    }
}
