//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

class Milk: Beverage, LactoseFree {
    private let lactoseAmount: Int
    
    init(volume: Int, calorie: Int, manufactured: Date?, expiredAfter: Date?, lactoseAmount: Int) {
        self.lactoseAmount = lactoseAmount
        super.init(volume: volume, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter)
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
