//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    let isCoffeeLatte: Bool
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, servingCaffeine: Int, isCoffeeLatte: Bool) {
        self.isCoffeeLatte = isCoffeeLatte
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, servingCaffeine: servingCaffeine)
    }
    
    func isLatte() -> Bool {
        return isCoffeeLatte
    }
}
