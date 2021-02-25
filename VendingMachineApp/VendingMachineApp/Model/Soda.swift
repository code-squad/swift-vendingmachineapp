//
//  Soda.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation

enum SodaType : String {
    case Cola = "콜라"
    case Sprite = "사이다"
    case Fanta = "환타"
}


class Soda :Drink {
    
    override init(brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
    }
}
