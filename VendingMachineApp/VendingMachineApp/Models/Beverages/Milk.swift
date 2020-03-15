//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Milk: Beverage {
    let farmCode: String
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, farmCode: String) {
        self.farmCode = farmCode
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate)
    }
    
    required init?(coder: NSCoder) {
        self.farmCode = coder.decodeObject(forKey: .farmCode) as? String ?? ""
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(object: farmCode, forKey: .farmCode)
    }
    
    func hasBeenProduced(from farmCode: String) -> Bool {
        return self.farmCode == farmCode
    }
}
