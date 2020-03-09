//
//  Milk.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    let expirationDate: Date
    
    init?(brand: String, volume: Int, price: Int,
          name: String, manufacturingDateInfo: String, expirationDateInfo: String) {
        guard let expirationDate = Date.dateFormatter.date(from: expirationDateInfo)
        else {
            return nil
        }
        
        self.expirationDate = expirationDate
        super.init(brand: brand, volume: volume, price: price,
        name: name, manufacturingDateInfo: manufacturingDateInfo)
    }
}
