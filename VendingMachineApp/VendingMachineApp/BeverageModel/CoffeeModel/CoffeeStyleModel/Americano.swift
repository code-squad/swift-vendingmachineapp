//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Americano: Coffee & EnergyBoostable {
    var isHeated: Bool
    var caffeine: Int
    
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, bean: Bean, caffeine: Int, inHeatingCabinet: Bool) {
        self.caffeine = caffeine
        self.isHeated = inHeatingCabinet
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, bean: bean)
    }
    
    func highCaffeine() -> Bool {
        return caffeine > 100
    }
    
    func isHot() -> Bool {
        return isHeated
    }
    
    func isEnergyBoosting() -> Bool {
        return highCaffeine() && isHot()
    }
}
