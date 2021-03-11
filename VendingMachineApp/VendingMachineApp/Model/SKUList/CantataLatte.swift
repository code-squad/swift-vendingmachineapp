//
//  CantataLatte.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation

class CantataLatte: Coffee {
    
    private var milkContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, caffeineContent: Int, agtronNumber: Int, isHot: Bool, milkContent: Int, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.milkContent = milkContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, agtronNumber: agtronNumber, isHot: isHot, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "롯데 칠성", volume: 275, price: 2200, subbrand: "칸타타 라떼", caffeineContent: 156, agtronNumber: 35, isHot: true, milkContent: 15, manufacturedAt: manufacturedAt, expiration: expiration, skuName: "칸타타 라떼 275ml 낱개")
    }
    
}
