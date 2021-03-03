//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Cantata: Coffee {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        super.init(brand: "롯데칠성", volume: 275, price: 1000, name: "칸타타", manufacturedAt: date)
    }
}
