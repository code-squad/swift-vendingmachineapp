//
//  Money.swift
//  VendingMachine
//
//  Created by Elena on 15/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Money: NSObject, Codable{
    private var money: Int

    init(money: Int = 0) {
        self.money = money
    }
    
    func addMoney(put: Int) -> Bool {
        guard put > 0 else { return false }
        self.money += put
        return true
    }

    func isBuy(money: Int) -> Bool {
        return self.money >= money
    }

    func subtract(price: Int) {
        self.money -= price
    }

    func showMoney() -> Int {
        return money
    }

    // MARK: - Codable
    enum MoneyCodingKeys : String, CodingKey{
        case money
    }
    
    init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: MoneyCodingKeys.self)
        money = try value.decode(Int.self, forKey: .money)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MoneyCodingKeys.self)
        try container.encode(money, forKey: .money)
    }
    
}

extension Int {
    // , 를 위해 구현
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
