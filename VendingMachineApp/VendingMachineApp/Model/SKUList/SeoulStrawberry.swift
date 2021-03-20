//
//  SeoulStrawberry.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class SeoulStrawberry: Milk {
    
    private var milkContent: Int
    
    required init() {
        self.milkContent = 0
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.milkContent = coder.decodeInteger(forKey: "milkContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(milkContent, forKey: "milkContent")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, calorieContent: Int, manufacturedAt: Date, expiration: Date, milkContent: Int, skuName: String) {
        self.milkContent = milkContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, calorieContent: calorieContent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 800, subbrand: "서울우유 딸기우유", calorieContent: 130, manufacturedAt: manufacturedAt, expiration: expiration, milkContent: 76, skuName: "서울우유 딸기우유 200ml 낱개")
    }
    
}
