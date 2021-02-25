//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

class Beverage: CustomStringConvertible  {
    var description: String {
        return "brand: \(self.brand), volume: \(self.volume), name: \(self.name), manufacturedDate: \(self.manufacturedDate)"
    }
    
    private var brand: String
    private var volume: Int
    private var name: String
    private var manufacturedDate: Date
    
    init(brand: String, volume: Int, name: String, manufacturedDate: Date) {
        self.brand = brand
        self.volume = volume
        self.name = name
        self.manufacturedDate = manufacturedDate
    }
}
