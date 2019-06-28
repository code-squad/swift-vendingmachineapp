//
//  Coffee.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Drink {
    private var hot: Bool
    
    enum CodingKeys: String, CodingKey {
        case hot
        case topLevelCoffeebeanContainPercent
    }
    
    enum ProductKeys: String, CodingKey {
        case vendingMachine
    }
    
    init(brand: String, ml: Int, price: Int, name: String, productDate: String, hot: Bool, barcode: String, expirationDate: String) {
        self.hot = hot
        
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate, barcode: barcode, expirationDate: expirationDate)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    func isHot() -> Bool {
        return hot
    }
}
