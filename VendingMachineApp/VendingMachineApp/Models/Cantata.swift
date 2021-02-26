//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    private let isHot: Bool
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, caffeineContent: Int, isHot: Bool) {
        self.isHot = isHot
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, caffeineContent: caffeineContent)
    }
}
