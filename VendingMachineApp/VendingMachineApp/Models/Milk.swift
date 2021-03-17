//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Milk: Beverage, LactoseFree {
    private let lactoseAmount: Int
    
    init(brand: String, volume: Int, price: Int, name: String, calorie: Int, imageName: String, manufactured: Date?, expiredAfter: Date?, lactoseAmount: Int) {
        self.lactoseAmount = lactoseAmount
        super.init(brand: brand, volume: volume, price: price, name: name, calorie: calorie, imageName: imageName, manufactured: manufactured, expiredAfter: expiredAfter)
    }
    
    struct PropertyKey {
        static let lactoseAmountKey = "lactoseAmount"
    }
    
    required init?(coder: NSCoder) {
        self.lactoseAmount = coder.decodeInteger(forKey: PropertyKey.lactoseAmountKey)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(lactoseAmount, forKey: PropertyKey.lactoseAmountKey)
        super.encode(with: coder)
    }
    
    func isLactoseFree() -> Bool {
        return lactoseAmount == 0
    }
}
