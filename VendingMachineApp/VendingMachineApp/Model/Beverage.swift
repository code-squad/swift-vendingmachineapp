//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Codable {
    
    private let name: String
    private let price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    convenience init() {
        self.init(name: DefaultData.beverage.name, price: DefaultData.beverage.price)
    }
    
    var description: String {
        return "\(self.name)"
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case price
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        price = try values.decode(Int.self, forKey: .price)
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name && rhs.price == rhs.price
    }
}
