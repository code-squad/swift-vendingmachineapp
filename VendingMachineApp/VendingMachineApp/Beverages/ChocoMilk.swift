//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    
    override var kind: String {
        return "초코우유"
    }
    private let farmCode = "farmOrganic"
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
    }
    
    convenience init() {
        self.init("서울우유", 200, 1000, "날마다초코우유", DateUtility.makeToday())
    }
    
    override func checkFarmCode() -> String {
        return self.farmCode
    }
    
}
