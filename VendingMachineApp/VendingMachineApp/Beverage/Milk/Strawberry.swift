//
//  Strawberry.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/01.
//

import Foundation

class Strawberry: Milk, BeverageInitable {
    
    private let strawberryContent: Int //함량
    
    init(strawberryContent: Int) {
        self.strawberryContent = strawberryContent
        super.init(brand: "서울우유", volume: 240, price: 1000, name: "딸기 우유", manufacturedAt: Date().addingTimeInterval(800000), temparature: 3, calories: 80, fat: 0.1)
    }
    
    required convenience init() {
        self.init(strawberryContent: 30)
    }
    
    func isFruitMilk(standard: Int) -> Bool {
        return self.strawberryContent <= standard ? true : false
    }
    
    required init?(coder: NSCoder) {
        self.strawberryContent = coder.decodeInteger(forKey: "strawberryContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(strawberryContent, forKey: "strawberryContent")
        super.encode(with: coder)
    }
}

