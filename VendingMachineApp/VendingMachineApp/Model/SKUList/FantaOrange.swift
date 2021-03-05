//
//  FantaOrange.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.

class FantaOrange: Soda {
    
    private var fruity: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, transparent: Bool, flavour: String, manufacturedAt: Date, expiration: Date, fruity: Bool, skuName: String) {
        self.fruity = fruity
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, transparent: transparent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "CocaCola", volume: 355, price: 1300, subbrand: "환타 오렌지맛", transparent: false, flavour: "Orange", manufacturedAt: manufacturedAt, expiration: expiration, fruity: true, skuName: "환타 오렌지맛 355ml 낱개")
    }
    
}
<<<<<<< HEAD
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.
