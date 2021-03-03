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
    
    func isHot() -> Bool {
        return temperature > 70
    }
}
