//
//  Coffee.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    //MARK: - Keys
    
    private let hasMilkKey: String = "hasMilk"
    private let isHotKey: String = "isHot"
    
    //MARK: Encode, Decode
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(hasMilk, forKey: self.hasMilkKey)
        aCoder.encode(isHot, forKey: self.isHotKey)
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        hasMilk = aDecoder.decodeBool(forKey: self.hasMilkKey)
        isHot = aDecoder.decodeBool(forKey: self.isHotKey)
        super.init(coder: aDecoder)
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private let hasMilk: Bool
    private let isHot: Bool
    
    //MARK: Initialize

    init(hasMilk: Bool, isHot: Bool, brand: String, size: Int, price: Int, name: String, expiryDate: Int) {
        self.hasMilk = hasMilk
        self.isHot = isHot
        super.init(brand: brand, size: size, price: price, name: name, expiryDate: expiryDate)
    }
}
