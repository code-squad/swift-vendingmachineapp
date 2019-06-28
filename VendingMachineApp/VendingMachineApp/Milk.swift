//
//  Milk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    private let farmCode: Int
    
    enum CodingKeys: String, CodingKey {
        case farmCode
    }
    
    enum ProductKeys: String, CodingKey {
        case vendingMachine
    }
    
    init(brand: String, ml: Int, price: Int, productDate: String, name: String, farmCode: Int, barcode: String, expirationDate: String) {
        self.farmCode = farmCode
        
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate, barcode: barcode, expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isFarmCode(_ farmCodeCompared: Int) -> Bool {
        return farmCode == farmCodeCompared
    }
}
