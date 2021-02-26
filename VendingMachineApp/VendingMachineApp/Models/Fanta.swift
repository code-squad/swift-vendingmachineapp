//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class Fanta: Soda {
    enum PackageMaterial {
        case plastic, can
    }
    
    private let packageMaterial: PackageMaterial
    
    init(manufacturer: String, volume: Int, name: String, dateOfManufacture: Date, price: Int, calorie: Int, packageMaterial: PackageMaterial, temperature: Int) {
        self.packageMaterial = packageMaterial
        super.init(manufacturer: manufacturer, volume: volume, name: name, dateOfManufacture: dateOfManufacture, price: price, calorie: calorie, temperature: temperature)
    }
}
