//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class Beverage {
    
    var description: String {
        return "\(brand), \(miliLiter)ml, \(price)원, \(name), \(dateOfManufacture.toString())"
    }
    
    private var brand: String
    private var miliLiter: Int
    private var price: Int
    private var name: String
    private var dateOfManufacture: Date
    
    init(brand: String, miliLiter: Int, price: Int, name: String, dateOfManufacture: Date) {
        self.brand = brand
        self.miliLiter = miliLiter
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
}
