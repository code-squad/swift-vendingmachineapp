//
//  CantataAmericano.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.

class CantataAmericano: Coffee {
    
    private var premium: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, caffeineContent: Int, whiteCoffee: Bool, isHot: Bool, premium: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.premium = premium
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, whiteCoffee: whiteCoffee, isHot: isHot, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "롯데 칠성", volume: 275, price: 2200, subbrand: "칸타타 아메리카노", caffeineContent: 112, whiteCoffee: false, isHot: true, premium: false, manufacturedAt: manufacturedAt, expiration: expiration, skuName: "칸타타 아메리카노 275ml 낱개")
    }
    
}
<<<<<<< HEAD
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.
