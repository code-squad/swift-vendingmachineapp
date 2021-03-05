//
//  SeoulSterilized.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.

class SeoulSterilized: Milk {
    
    private var sterilized: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, flavored: Bool, sterilized: Bool, manufacturedAt: Date, expiration: Date, skuName: String) {
        self.sterilized = sterilized
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, flavored: flavored, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 500, subbrand: "서울우유 멸균우유", flavored: false, sterilized: true, manufacturedAt: manufacturedAt, expiration: expiration, skuName: "서울우유 멸균우유 200ml 낱개")
    }
    
}
<<<<<<< HEAD
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.
