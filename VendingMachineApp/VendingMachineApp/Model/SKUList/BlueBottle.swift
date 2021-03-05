//
//  BlueBottle.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD

class BlueBottle: Coffee {
    
    private var roastingPoint: String
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, caffeineContent: Int, whiteCoffee: Bool, isHot: Bool, roastingPoint: String, manufacturedAt: Date, expiration: Date, hot: Bool, skuName: String) {
        self.roastingPoint = roastingPoint
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, whiteCoffee: whiteCoffee, isHot: isHot, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "BlueBottle", volume: 236, price: 6300, subbrand: "BlueBottle Cold Brewed", caffeineContent: 205, whiteCoffee: false, isHot: false, roastingPoint: "Bold", manufacturedAt: manufacturedAt, expiration: expiration, hot: false, skuName: "블루보틀 콜드브루 볼드 캔 236ml 낱개")
    }
    
}
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
