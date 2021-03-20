//
//  BlueBottle.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class BlueBottle: Coffee {
    
    private var roastingPoint: Int
    
    required init() {
        self.roastingPoint = 0
        super.init()
    }
    
    required init?(coder: NSCoder) {
        self.roastingPoint = coder.decodeInteger(forKey: "roastingPoint")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(roastingPoint, forKey: "roastingPoint")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, caffeineContent: Int, agtronNumber: Int, isHot: Bool, roastingPoint: Int, manufacturedAt: Date, expiration: Date, hot: Bool, skuName: String) {
        self.roastingPoint = roastingPoint
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, agtronNumber: agtronNumber, isHot: isHot, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "BlueBottle", volume: 236, price: 6300, subbrand: "BlueBottle Cold Brewed", caffeineContent: 205, agtronNumber: 53, isHot: false, roastingPoint: 4, manufacturedAt: manufacturedAt, expiration: expiration, hot: false, skuName: "블루보틀 콜드브루 볼드 캔 236ml 낱개")
    }
    
}
