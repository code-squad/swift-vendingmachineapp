//
//  Sprite.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {
    
    override var kind: String {
        return "스프라이트"
    }
    private let calorie = 120
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
    }
    
    convenience init() {
        self.init("스프라이트", 300, 1500, "스프라이트", DateUtility.makeToday())
    }

    override func isLowCalorie() -> Bool {
        return 10 > self.calorie
    }
}
