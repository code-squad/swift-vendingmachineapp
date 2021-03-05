//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD

class Sprite: Soda {
    
    private var citrus: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, transparent: Bool, manufacturedAt: Date, expiration: Date, citrus: Bool, skuName: String) {
        self.citrus = citrus
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, transparent: transparent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "CocaCola", volume: 500, price: 1800, subbrand: "스프라이트", transparent: true, manufacturedAt: manufacturedAt, expiration: expiration, citrus: true, skuName: "스프라이트 500ml 낱개")
    }
    
}
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
