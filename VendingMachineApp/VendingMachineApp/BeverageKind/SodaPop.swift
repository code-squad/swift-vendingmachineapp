//
//  SodaPop.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class SodaPop: Beverage, BeverageCheck {
    private (set) var kind: String
    private let sugarContent: Double
    init(kind: String, sugarContent: Double, temperature: Double, brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.kind = kind
        self.sugarContent = sugarContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate, temperature: temperature)
    }
    func isHighSugar() -> Bool {
        return sugarContent > 5
    }
    func isHot() -> Bool {
        return super.temperature > 30
    }
    // 탄산음료의 유통기한은 제조일로부터 1년입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: DateInterval.year.rawValue, since: self.manufacturingDate) > Date(timeInterval: DateInterval.today.rawValue, since: with)
    }
}
