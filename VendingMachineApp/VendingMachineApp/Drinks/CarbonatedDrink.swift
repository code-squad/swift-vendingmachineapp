//
//  CarbonatedDrink .swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    var isZeroCalorie: Bool
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, isZeroCalorie: Bool) {
        self.isZeroCalorie = isZeroCalorie
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
    
    func isZeroCalorieDrink() -> Bool {
        return isZeroCalorie
    }
}
