//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class StrawberryMilk: Milk {
    
    private let cochineal : Bool //how many day after manufacturingDate
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, expirationLimit : Int, cochineal : Bool) {
        self.cochineal = cochineal
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, expirationLimit: expirationLimit)
    }
    
    func isCochineal() -> Bool {
        return self.cochineal
    }
}
