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
    
    init?(volume: Int, price: Int, name: String,
          manufacturingDateInfo: String, celsius: Int,
          milkContentRate: Double, sugarContentRate: Double) {
        guard milkContentRate >= Quantity.minRate, milkContentRate <= Quantity.maxRate,
            sugarContentRate >= Quantity.minRate, sugarContentRate <= Quantity.maxRate
            else {
                return nil
        }
        
        self.milkContentRate = milkContentRate
        self.sugarContentRate = sugarContentRate
        super.init(brand: "칸타타",
                   volume: volume, price: price,
                   name: name,
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
