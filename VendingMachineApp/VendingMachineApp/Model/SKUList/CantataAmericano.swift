//
//  CantataAmericano.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class CantataAmericano: Coffee {
    
    private var coffeeContent: Int
    
    required init() {
        self.coffeeContent = 0
        super.init()
    }

    required init?(coder: NSCoder) {
        self.coffeeContent = coder.decodeInteger(forKey: "coffeeContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(coffeeContent, forKey: "coffeeContent")
        super.encode(with: coder)
    }
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, caffeineContent: Int, agtronNumber: Int, isHot: Bool, coffeeContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.coffeeContent = coffeeContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, agtronNumber: agtronNumber, isHot: isHot, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "롯데 칠성", volume: 275, price: 2200, subbrand: "칸타타 아메리카노", caffeineContent: 112, agtronNumber: 40, isHot: true, coffeeContent: 30, manufacturedAt: manufacturedAt, expiration: expiration, skuName: "칸타타 아메리카노 275ml 낱개")
    }
    
}
