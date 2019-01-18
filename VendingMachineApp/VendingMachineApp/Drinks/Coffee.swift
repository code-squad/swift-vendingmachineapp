//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    var caffeineAmount: Double
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, caffeineAmount: Double) {
        self.caffeineAmount = caffeineAmount
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.caffeineAmount = aDecoder.decodeDouble(forKey: "caffeineAmount")
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(caffeineAmount, forKey: "caffeineAmount")
    }
    
    func howMuchCaffeineAmount() -> Double {
        return caffeineAmount
    }
}
