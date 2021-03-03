//
//  chocoMilk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class ChocoMilk: Milk {
    
    private let chocolateContent : Float // percent
    private let thickChocolateCriteria : Float = 1
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, expirationLimit : Int, chocolateContent : Float) {
        self.chocolateContent = chocolateContent
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, expirationLimit: expirationLimit)
    }
    
    func isRealCholate() -> Bool {
        return chocolateContent > thickChocolateCriteria
    }
}
