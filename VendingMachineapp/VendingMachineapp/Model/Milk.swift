//
//  Milk.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

enum MilkType: String {
    case strawberry = "딸기우유"
    case banana = "바나나우유"
    case choco = "초코우유"
    case unknown = ""
}

class Milk: Beverage {
    private var type: MilkType
    private var lowFat: Bool
    
    init(manufacturer: String, volume: Int, price: Int, brand: String, manufactured: Date, type: MilkType, lowFat: Bool) {
        self.type = type
        self.lowFat = lowFat
        super.init(manufacturer: manufacturer, volume: volume, price: price, brand: brand, manufactured: manufactured)
    }
    
    func isLowFat() -> Bool {
        return self.lowFat
    }
}
