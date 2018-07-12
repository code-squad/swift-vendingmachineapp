//
//  Georgia.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    
    private let temperature = 70
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
        self.kind = "조지아"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    convenience init() {
        self.init("조지아", 350, 2500, "카페라떼", DateUtility.makeToday())
    }
    
    override func isHot() -> Bool {
        return 50 < self.temperature
    }
    
}
