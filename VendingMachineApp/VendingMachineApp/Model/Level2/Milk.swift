//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import Foundation

class Milk: Beverage {
 
    private var farmCode: String
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacture: Date, farmCode: String, expiredAt: Date) {
        self.farmCode = farmCode
   
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacture: manufacture, expiredAt: expiredAt)
    }
    
    required init() {
        self.farmCode = "unknown"
        super.init(brand: "unknown",
                   capacity: 0,
                   price: 0,
                   name: "unknown",
                   manufacture: Date(),
                   expiredAt: Date()
        )
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(farmCode, forKey: "farmCoder")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.farmCode = coder.decodeObject(forKey: "farmCoder") as! String
        super.init(coder: coder)
    }
}
