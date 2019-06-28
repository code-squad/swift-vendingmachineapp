//
//  Sparkling.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sparkling: Drink {
    private let calorie: Int
    
    enum CodingKeys: String, CodingKey {
        case calorie
        case orangeIncense
    }
    
    enum ProductKeys: String, CodingKey {
        case vendingMachine
    }
    
    init(brand: String, ml: Int, price: Int, name: String, productDate: String, calorie: Int, barcode: String, expirationDate: String) {
        self.calorie = calorie
        
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate, barcode: barcode, expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isLowCalorie() -> Bool {
        return calorie < 50
    }
}
