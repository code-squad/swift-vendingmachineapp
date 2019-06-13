//
//  History.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//이력, 내역
class History: NSObject, Codable {
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience override init() {
        self.init(purchases: [])
    }

    func add(purchase beverage: Beverage) {
        purchases.append(beverage)
    }
    
    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }
    
    // MARK: - Codable
    enum HistoryCodingKeys : String, CodingKey{
        case purchases
    }
    
    init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: HistoryCodingKeys.self)
        purchases = try value.decode([Beverage].self, forKey: .purchases)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: HistoryCodingKeys.self)
        try container.encode(purchases, forKey: .purchases)
    }
    
}

