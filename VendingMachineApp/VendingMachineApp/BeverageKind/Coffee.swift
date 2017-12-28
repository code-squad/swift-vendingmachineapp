//
//  Coffee.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Coffee: Beverage, BeverageCheck {
    private (set) var kind: String
    private let caffeine: Bool
    init(kind: String, caffeine: Bool, temperature: Double, brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.kind = kind
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate, temperature: temperature)
    }
    func isCaffeine() -> Bool {
        return caffeine
    }
    func isHot() -> Bool {
        return super.temperature > 80
    }
    // 커피의 유통기한은 2일입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: DateInterval.twoDays.rawValue, since: self.manufacturingDate) > Date(timeInterval: DateInterval.today.rawValue, since: with)
    }
}
