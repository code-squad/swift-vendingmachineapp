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
    
    convenience required init() {
        self.init(brand: "class", volume : 0, charge: 0, name : "Milk", manufacturing: Date.init(), expirationLimit: 0)
    }
    
    required init?(coder: NSCoder) {
        expirationLimit = coder.decodeInteger(forKey: "expirationLimit")
        super.init(coder: coder)
    }
    
    func isWithInExpiration() -> Bool {
        let lastDay = manufacturing.afterDays(days: expirationLimit)
        return lastDay.compareNowWith()
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(expirationLimit,forKey: "expirationLimit")
    }
}
