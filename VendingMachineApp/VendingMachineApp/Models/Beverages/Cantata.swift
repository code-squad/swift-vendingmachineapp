//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class Cantata: Coffee {
    
    private let milkContentRate: Double
    private let sugarContentRate: Double
    
    init?(cantataBuilder: Cantata.CantataBuilder,
          manufacturingDateInfo: String,
          celsius: Int) {
        self.milkContentRate = cantataBuilder.milkContentRate
        self.sugarContentRate = cantataBuilder.sugarContentRate
        super.init(builder: cantataBuilder,
                   manufacturingDateInfo: manufacturingDateInfo,
                   celsius: celsius)
    }
    
    func isContainsMilk() -> Bool {
        return milkContentRate == Quantity.minRate
    }
    
    func isContainsSugar() -> Bool {
        return sugarContentRate == Quantity.minRate
    }
    
}

extension Cantata {
    
    override var description: String {
        return super.description +
            ", 우유: \(milkContentRate)%" +
        ", 설탕: \(sugarContentRate)%"
    }
    
}

extension Cantata {
    
    class CantataBuilder: Beverage.Builder {
        
        let milkContentRate: Double
        let sugarContentRate: Double
        
        init(brand: String,
             name: String,
             volume: Int,
             price: Int,
             milkContentRate: Double,
             sugarContentRate: Double) {
            self.milkContentRate = milkContentRate
            self.sugarContentRate = sugarContentRate
            super.init(brand: brand,
                       name: name,
                       volume: volume,
                       price: price)
        }
       
    }
    
}
