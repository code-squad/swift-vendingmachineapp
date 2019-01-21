//
//  Milk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    //MARK: - Keys
    
    private let lactoseKey: String = "lactose"
    
    //MARK: Encode, Decode
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(lactose, forKey: self.lactoseKey)
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        lactose = aDecoder.decodeInteger(forKey: self.lactoseKey)
        super.init(coder: aDecoder)
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private let lactose: Int

    //MARK: Initialize
    
    init(lactose: Int, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.lactose = lactose
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }
    
    //MARK: - Methods
    
    func hasLactose() -> Bool {
        return self.lactose > 0
    }
}
