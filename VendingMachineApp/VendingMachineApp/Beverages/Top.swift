//
//  Top.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Top: Coffee {
    
    private let temperature = -20
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
        self.kind = "티오피"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    convenience init() {
        self.init("맥심", 400, 3000, "TOP아메리카노", DateUtility.makeToday())
    }
    
    override func isHot() -> Bool {
        return 50 < self.temperature
    }
}
