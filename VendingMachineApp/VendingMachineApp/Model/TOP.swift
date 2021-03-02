//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class TOP: Coffee {
    
    private let temperature : Double
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, caffeine : Double?, temperature : Double) {
        self.temperature = temperature
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, caffeine: caffeine)
    }
    
    convenience init() {
        self.init(brand: "Maxim", volume: 275, charge: 980, name: "TOP 스위트 아메리카노", manufacturing: Date.init(), caffeine : 123.45, temperature: 73.3)
    }
    
    func isHot() -> Bool {
        return temperature > 70
    }
}
