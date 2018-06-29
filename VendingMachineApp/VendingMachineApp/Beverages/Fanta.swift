//
//  Fanta.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Fanta: Soda {
    
    override var kind: String {
         return "환타"
    }
    private let calorie = 190
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
    }
    
    convenience init() {
        self.init("환타", 350, 2500, "파인", DateUtility.makeToday())
    }
    
    override func isLowCalorie() -> Bool {
        return 10 > self.calorie
    }
}
