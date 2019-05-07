//
//  History.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//이력, 내역
class History {
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience init() {
        self.init(purchases: [])
    }

    func add(purchase beverage: Beverage) {
        purchases.append(beverage)
    }

}

extension History: Equatable {
    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }
}
