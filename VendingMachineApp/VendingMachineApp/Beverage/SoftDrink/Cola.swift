//
//  Cola.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Cola: SoftDrink, BeverageInitable {
    
    private let transFat: Int
    
    init(transFat: Int) {
        self.transFat = transFat
        super.init(brand: "코카콜라", volume: 250, price: 1000, name: "코카콜라", manufacturedAt: Date().addingTimeInterval(800000), temparature: 2, calories: 90, isLowfat: false, package: .can)
    }
    
    required convenience init() {
        self.init(transFat: 7)
    }
    
    func isNoneTransFat() -> Bool {
        return self.transFat == 0
    }
    
    required init?(coder: NSCoder) {
        self.transFat = coder.decodeInteger(forKey: "colaTransFat")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(transFat, forKey: "colaTransFat")
        super.encode(with: coder)
    }
}
