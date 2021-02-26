//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Americano: Coffee & EnergyBoostable {
    var inHeatingCabinet: Bool
    var caffeine: Int
    
    init(brand: String, size: Milli_Liter, price: Int, name: String, packDate: Date, bean: Bean, caffeine: Int, inHeatingCabinet: Bool) {
        self.caffeine = caffeine
        self.inHeatingCabinet = inHeatingCabinet
        super.init(brand: brand, size: size, price: price, name: name, packDate: packDate, bean: bean)
    }
    
    func highCaffeine() -> Bool {
        return caffeine > 100
    }
    
    func isHot() -> Bool {
        return inHeatingCabinet
    }
    
    func boostEnerge() -> Bool {
        return highCaffeine() && isHot()
    }
}
