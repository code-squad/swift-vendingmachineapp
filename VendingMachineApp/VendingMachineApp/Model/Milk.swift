//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Milk: Drink {
    
    private let expirationLimit : Int //how many day after manufacturingDate
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, expirationLimit : Int) {
        self.expirationLimit = expirationLimit
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing)
    }
    
    convenience init() {
        self.init(brand: "서울우유", volume: 200, charge: 830, name: "초코우유", manufacturing: Date.init().createRandomIn7days(), expirationLimit: 3)
    }
    
    func validate() -> Bool {
        let lastDay = afterManufacuring(days: expirationLimit)
        return compareNowWith(date: lastDay)
    }
}
