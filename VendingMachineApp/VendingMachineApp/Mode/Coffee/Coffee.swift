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
         expiryPeriod: ExpirationPeriod = ExpirationPeriod(endDay: Coffee.expiredays)) {
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
    
    // MARK: - Codable
    // enum
    enum CoffeeCodingKey : String, CodingKey{
        case caffeine
        case hot
    }
    
    override init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CoffeeCodingKey.self)
        caffeine = try value.decode(Int.self, forKey: .caffeine)
        hot = try value.decode(Bool.self, forKey: .hot)
        try super.init(form: decoder)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    override func encode(to encoder: Encoder) throws {
        //try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CoffeeCodingKey.self)
        try container.encode(caffeine, forKey: .caffeine)
        try container.encode(hot, forKey: .hot)
    }
    
}

