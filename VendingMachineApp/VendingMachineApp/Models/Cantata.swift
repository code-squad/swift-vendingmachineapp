//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

final class Cantata: Coffee {
    
    private let percentMilk: Double
    private let percentSugar: Double
    
    init?(volume: Int, price: Int, name: String,
          manufacturingDateInfo: String, celsius: Int,
          percentMilk: Double, percentSugar: Double) {
        guard percentMilk >= Quantity.minPercent, percentMilk <= Quantity.maxPercent,
            percentSugar >= Quantity.minPercent, percentSugar <= Quantity.maxPercent
            else {
                return nil
        }
        
        self.percentMilk = percentMilk
        self.percentSugar = percentSugar
        super.init(brand: "칸타타",
                   volume: volume, price: price,
                   name: name,
                   manufacturingDateInfo: manufacturingDateInfo,
                   celsius: celsius)
    }
    
    func isContainsMilk() -> Bool {
        return percentMilk == Quantity.minPercent
    }
    
    func isContainsSugar() -> Bool {
        return percentSugar == Quantity.minPercent
    }
    
}

extension Cantata {
    
    override var description: String {
        return super.description +
            ", 우유: \(percentMilk)%" +
        ", 설탕: \(percentSugar)%"
    }
    
}
