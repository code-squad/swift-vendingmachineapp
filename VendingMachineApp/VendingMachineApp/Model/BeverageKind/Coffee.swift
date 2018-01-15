//
//  Coffee.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Coffee: Beverage, BeverageCheck {
    private (set) var kind: String = ""
    private var caffeine: Bool = true
    init(kind: String, caffeine: Bool, temperature: Double, brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.kind = kind
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate, temperature: temperature)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let kind = aDecoder.decodeObject(forKey: "kind") as? String else {
            return
        }
        self.kind = kind
        self.caffeine = aDecoder.decodeBool(forKey: "caffeine")
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.kind, forKey: "kind")
        aCoder.encode(self.caffeine, forKey: "caffeine")
        super.encode(with: aCoder)
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
