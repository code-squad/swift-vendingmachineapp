//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Coffee: Beverage, HotServable, CaffeineContainable {
    private let servingTemperature: Int
    private let caffeineAmount: Int
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, imageName: String, manufactured: Date?, expiredAfter: Date?, servingTemperature: Int, caffeineAmount: Int) {
        self.servingTemperature = servingTemperature
        self.caffeineAmount = caffeineAmount
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, imageName: imageName, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    struct PropertyKey {
        static let servingTemperatureKey = "servingTemperature"
        static let caffeineAmountKey = "caffeineAmount"
    }
    
    required init?(coder: NSCoder) {
        self.servingTemperature = coder.decodeInteger(forKey: PropertyKey.servingTemperatureKey)
        self.caffeineAmount = coder.decodeInteger(forKey: PropertyKey.caffeineAmountKey)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(servingTemperature, forKey: PropertyKey.servingTemperatureKey)
        coder.encode(caffeineAmount, forKey: PropertyKey.caffeineAmountKey)
        super.encode(with: coder)
    }
    
    func isHotter(than referenceTemperature: Int) -> Bool {
        return servingTemperature >= referenceTemperature
    }
    
    func hasCaffeine() -> Bool {
        return caffeineAmount > 0
    }
}
