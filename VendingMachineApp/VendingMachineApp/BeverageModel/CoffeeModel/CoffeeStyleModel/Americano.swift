//
//  Americano.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Americano: Coffee & EnergyBoostable {
    var temperature: Int
    var caffeine: Int
    
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, bean: Bean, caffeine: Int, temperature: Int) {
        self.caffeine = caffeine
        self.temperature = temperature
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, bean: bean)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(temperature, forKey: "temperature")
        coder.encode(caffeine, forKey: "caffeine")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        temperature = eDecoder.decodeInteger(forKey: "temperature")
        caffeine = eDecoder.decodeInteger(forKey: "caffeine")
        super.init(coder: eDecoder)
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
