//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Americano: Coffee & EnergyBoostable {
    var caffeine: Int
    var temperature: Int
    
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date, bean: String, caffeine: Int, temperature: Int) {
        self.caffeine = caffeine
        self.temperature = temperature
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, bean: bean)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(caffeine, forKey: "caffeine")
        coder.encode(temperature, forKey: "temperature")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        caffeine = coder.decodeInteger(forKey: "caffeine")
        temperature = coder.decodeInteger(forKey: "temperature")
        super.init(coder: coder)
    }
    
    func highCaffeine(caffeine criterion: Int) -> Bool {
        return caffeine > criterion
    }
    
    func isHot(temperature criterion: Int) -> Bool {
        return temperature > criterion
    }
    
    func isEnergyBoosting(caffeine: Int, temperature: Int) -> Bool {
        return highCaffeine(caffeine: caffeine) && isHot(temperature: temperature)
    }
}
