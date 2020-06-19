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
    
    init(
        milkContentRate: Double,
        sugarContentRate: Double,
        celsius: Int,
        name: String,
        volume: Int,
        price: Int
    ) {
        self.milkContentRate = milkContentRate
        self.sugarContentRate = sugarContentRate
        super.init(celsius: celsius,
                   brand: "칸타타",
                   name: name,
                   volume: volume,
                   price: price)
    }
    
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        hasher.combine(milkContentRate)
        hasher.combine(sugarContentRate)
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
