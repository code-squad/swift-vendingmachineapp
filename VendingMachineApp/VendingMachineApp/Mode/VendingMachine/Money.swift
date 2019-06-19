//
//  Money.swift
//  VendingMachine
//
//  Created by Elena on 15/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Money: NSObject{
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

    // MARK: - NSSecureCoding
    enum MoneyCodingKeys : String, CodingKey{
        case money
    }
    
    required init?(coder aDecoder: NSCoder) {
        let money = aDecoder
            .decodeObject(of: NSNumber.self, forKey: MoneyCodingKeys.money.rawValue) ?? 0
        self.money = money.intValue
    }
    
}

extension Money: NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(NSNumber(value: money), forKey: MoneyCodingKeys.money.rawValue)
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
