//
//  SeoulStrawberry.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD

class SeoulStrawberry: Milk {
    
    private var milkContent: Int
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, calorieContent: Int, manufacturedAt: Date, expiration: Date, milkContent: Int, skuName: String) {
        self.milkContent = milkContent
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, calorieContent: calorieContent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "서울우유", volume: 200, price: 800, subbrand: "서울우유 딸기우유", calorieContent: 130, manufacturedAt: manufacturedAt, expiration: expiration, milkContent: 76, skuName: "서울우유 딸기우유 200ml 낱개")
    }
    
}
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
