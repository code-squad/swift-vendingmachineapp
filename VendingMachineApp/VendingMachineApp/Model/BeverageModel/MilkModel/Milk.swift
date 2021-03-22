//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Milk: Beverage {
    private let farm: LocationTrackable
    
    public init(brand: String, size: Int, price: Int, name: String, packageTime: Date, farm: LocationTrackable) {
        self.farm = farm
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(farm, forKey: "farm")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        farm = coder.decodeObject(forKey: "farm") as! LocationTrackable
        super.init(coder: coder)
    }
    
    required init(brand: String, size: Int, price: Int, name: String, packageTime: Date) {
        self.farm = BeverageFactory.generateRandomLocation()
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime)
    }
}
