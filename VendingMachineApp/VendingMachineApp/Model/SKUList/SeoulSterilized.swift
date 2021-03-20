//
//  SeoulSterilized.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class SeoulSterilized: Milk {
    
    private var saturatedFatContent: Int
    
    required init() {
        self.saturatedFatContent = 0
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.saturatedFatContent = coder.decodeInteger(forKey: "saturatedFatContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(saturatedFatContent, forKey: "saturatedFatContent")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, calorieContent: Int, saturatedFatContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.saturatedFatContent = saturatedFatContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, calorieContent: calorieContent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 500, subbrand: "서울우유 멸균우유", calorieContent: 120, saturatedFatContent: 43, manufacturedAt: manufacturedAt, expiration: expiration, skuName: "서울우유 멸균우유 200ml 낱개")
    }
    
}
