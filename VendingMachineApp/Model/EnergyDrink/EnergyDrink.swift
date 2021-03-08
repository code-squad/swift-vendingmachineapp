//
//  EnergyDrink.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation
import UIKit

class EnergyDrink : Beverage {
    
    private let caffeine : Int
    
    init(brand: String, capacity: Int, price: Int, name: String, createdAt: String, expiredAt: String , image : UIImage?, caffeine : Int){
        self.caffeine = caffeine
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   image: image)
    }
}
