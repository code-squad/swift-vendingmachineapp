//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Milk: Drink {
    
    private let expirationLimit : Int //how many day after manufacturingDate
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, expirationLimit : Int) {
        self.expirationLimit = expirationLimit
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing)
    }
    
    convenience init() {
        self.init(brand: "서울우유", volume: 200, charge: 830, name: "초코우유", manufacturing: Date.init().createRandomIn7days(), expirationLimit: 3)
    }
    
    /// 지금과, date를 second까지 비교, date가 더 미래라면 true, else = false. 낮은 경우의 수로 지금과 date가 동일 시간이어도, false로 처리함.
    func validate() -> Bool {
        let lastDay = manufacturing.afterDays(days: expirationLimit)
        return lastDay.compareNowWith()
    }
}
