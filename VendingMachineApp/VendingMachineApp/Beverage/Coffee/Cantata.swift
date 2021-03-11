//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/01.
//

import Foundation

class Cantata: Coffee, BeverageInitable {
    
    private let milkContent: Int
    
    init(milkContent: Int) {
        self.milkContent = milkContent
        super.init(brand: "롯데", volume: 350, price: 2000, name: "콘트라베이스 콜드브루", manufacturedAt: Date().addingTimeInterval(800000), temparature: 2, calories: 3, isLowfat: false, caffeinContent: 90)
    }
    
    required convenience init() {
        self.init(milkContent: 15)
    }
    
    func isLatte(standard: Int) -> Bool {
        return self.milkContent > standard ? true : false
    }
    
    required init?(coder: NSCoder) {
        self.milkContent = coder.decodeInteger(forKey: "cantataMilkContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(milkContent, forKey: "cantataMilkContent")
        super.encode(with: coder)
    }
}
