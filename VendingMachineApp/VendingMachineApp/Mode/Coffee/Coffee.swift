//
//  Coffee.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {

    private let caffeine: Int?
    private let hot: Bool
    static let expiredays: Int = 60

    init(brand: String,
         volume: Int,
         price: Int,
         name: String,
         manufacturedDate: Date,
         caffeine: Int? = nil,
         hot: Bool = false,
         expiryPeriod: ExpirationPeriod = ExpirationPeriod(endDay: 60)) {
        self.caffeine = caffeine
        self.hot = hot
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate,
            expiryPeriod: expiryPeriod)
    }

    // Required Initializers
    required convenience init() {
        self.init(
            brand: "",
            volume: 0,
            price: 0,
            name: "",
            manufacturedDate: Date(),
            expiryPeriod: ExpirationPeriod(endDay: 0)
        )
    }
    
    func same(_ number: Int) -> Bool {
        return self.caffeine == number
    }

    func isHot() -> Bool {
        if hot == true { return hot }
        return false
    }
    
    // MARK: - NSSecureCoding
    enum CoffeeCodingKey : String, CodingKey{
        case caffeine
        case hot
        case expiredays
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        let caffeine = aDecoder.decodeObject(of: NSNumber.self, forKey: CoffeeCodingKey.caffeine.rawValue) ?? 0
        hot = aDecoder.decodeBool(forKey: CoffeeCodingKey.hot.rawValue)
        self.caffeine = caffeine.intValue

        
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(NSNumber(value: caffeine!), forKey: CoffeeCodingKey.caffeine.rawValue)
        aCoder.encode(hot, forKey: CoffeeCodingKey.hot.rawValue)
    }
    
}

