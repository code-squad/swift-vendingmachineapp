//
//  SeoulChoco.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD

class SeoulChoco: Milk {
    
    private var bitterSweet: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, manufacturedAt: Date, expiration: Date, bitterSweet: Bool, skuName: String) {
        self.bitterSweet = bitterSweet
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, flavored: flavored, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 800, subbrand: "서울우유 초코우유", flavored: true, manufacturedAt: manufacturedAt, expiration: expiration, bitterSweet: true, skuName: "서울우유 초코우유 200ml 낱개")
    }
    
}
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
