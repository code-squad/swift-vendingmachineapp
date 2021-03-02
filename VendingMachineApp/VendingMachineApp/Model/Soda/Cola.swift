//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

class Cola: Soda {
    enum Package {
        case can
        case pet
        case glass
    }
    private var packageAttribute: Package
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, expirationDate: Date, temperature: Double, glycemicIndex: Int, packageAttribute: Package) {
        self.packageAttribute = packageAttribute
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationDate: expirationDate, temperature: temperature, glycemicIndex: glycemicIndex)
    }
    func isPet() -> Bool{
        return self.packageAttribute == Package.pet
    }
}
