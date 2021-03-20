//
//  DrPepper.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class DrPepper: Soda {
    
    private var calorieContent: Int
    
    required init() {
        self.calorieContent = 0
        super.init()
    }

    required init?(coder: NSCoder) {
        self.calorieContent = coder.decodeInteger(forKey: "calorieContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(calorieContent, forKey: "calorieContent")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, sugarContent: Int, manufacturedAt: Date, expiration: Date, calorieContent: Int, skuName: String) {
        self.calorieContent = calorieContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, sugarContent: sugarContent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "Keurig", volume: 355, price: 1300, subbrand: "닥터페퍼", sugarContent: 37, manufacturedAt: manufacturedAt, expiration: expiration, calorieContent: 148, skuName: "닥터페퍼 355ml 낱개")
    }
    
}
