//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {

    private let farmCode = "farmFresh"
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
        self.kind = "바나나우유"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    convenience init() {
        self.init("서울우유", 200, 1000, "날마다바나나우유", DateUtility.makeToday())
    }

    override func checkFarmCode() -> String {
        return self.farmCode
    }
}

