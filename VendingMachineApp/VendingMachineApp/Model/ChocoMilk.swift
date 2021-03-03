//
//  chocoMilk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class ChocoMilk: Milk {
    
    private let chocolateContent : Float // percent
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, expirationLimit : Int, chocolateContent : Float) {
        self.chocolateContent = chocolateContent
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, expirationLimit: expirationLimit)
    }
    
    convenience init() {
        self.init(brand: "서울우유", volume: 200, charge: 830, name: "초코우유", manufacturing: Date.init().createRandomIn7days(), expirationLimit: 3, chocolateContent: 8)
    }
    
    func isRealCholate() -> Bool {
        return chocolateContent > 1
    }
}
