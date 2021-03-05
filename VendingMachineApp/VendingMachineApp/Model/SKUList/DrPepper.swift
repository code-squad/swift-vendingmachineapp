//
//  DrPepper.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/04.
//

import Foundation
<<<<<<< HEAD

class DrPepper: Soda {
    
    private var developerFavorite: Bool
    
    init(manufacturer: String, volume: Int, price: Int, subbrand: String, transparent: Bool, manufacturedAt: Date, expiration: Date, developerFavorite: Bool, skuName: String) {
        self.developerFavorite = developerFavorite
        super.init(manufacturer: manufacturer, volume: volume, price: price, subbrand: subbrand, transparent: transparent, manufacturedAt: manufacturedAt, expiration: expiration, skuName: skuName)
    }
    
    convenience init(manufacturedAt: Date, expiration: Date) {
        self.init(manufacturer: "Keurig", volume: 355, price: 1300, subbrand: "닥터페퍼", transparent: false, manufacturedAt: manufacturedAt, expiration: expiration, developerFavorite: true, skuName: "닥터페퍼 355ml 낱개")
    }
    
}
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
