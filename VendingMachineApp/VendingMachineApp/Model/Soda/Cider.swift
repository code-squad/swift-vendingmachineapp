//
//  Cider.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Cider: Soda {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "코카콜라", volume: 185, price: 1000, name: "스프라이트", manufacturedAt: date)
    }
}
