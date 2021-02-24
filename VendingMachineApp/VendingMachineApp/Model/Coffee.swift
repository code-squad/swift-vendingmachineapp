//
//  coffee.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation


class Coffee: Drink {
    
    // 카페인 추가 -> optional 선언으로 decaffein 구현
    // 하위 : 원두 품종
    //  뜨거움 여부
    
    private let caffeine : Double?
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, caffeine : Double?) {
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing)
    }
    
    func productCaffeine() -> String {
        guard let nonOptional = caffeine else {
            return "deCaffeine"
        }
        
        return "\(nonOptional) mg"
    }
}
