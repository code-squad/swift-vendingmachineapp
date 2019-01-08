//
//  Money.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 03/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import Foundation

class Money: NSObject {
    private var balance: Int

    enum Unit: Int {
        case oneThousand = 1000
        case fiveThousands = 5000
    }

    init(initialBalance: Int = 0) {
        self.balance = initialBalance
    }

    init(unit: Money.Unit) {
        self.balance = unit.rawValue
    }

    func isPositive() -> Bool {
        return balance > 0
    }

    static func +(_ lhs: Money, _ rhs: Money) -> Money {
        let sum = lhs.balance + rhs.balance
        return Money(initialBalance: sum)
    }

    func deductedPrice(of beverage: Beverage) {
        balance = beverage.subtractPrice(from: balance)
    }

    func show(with show: (Int) -> Void) {
        show(balance)
    }

    func isEnoughToBuy(pack: Pack) -> Bool {
        return pack.isBuyable(with: balance)
    }

    /* MARK: NSSecureCoding */
    private struct Defualt {
        static let balance: NSNumber = 0
    }

    required init?(coder aDecoder: NSCoder) {
        let balance = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.balance.rawValue) ?? Defualt.balance
        self.balance = balance.intValue
    }

}

extension Money: NSSecureCoding {

    private enum Keys: String {
        case balance = "balance"
    }

    static var supportsSecureCoding: Bool {
        return true
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(NSNumber(value: balance), forKey: Keys.balance.rawValue)
    }

}
