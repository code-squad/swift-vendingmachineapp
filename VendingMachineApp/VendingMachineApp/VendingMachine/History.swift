//
//  History.swift
//  VendingMachine
//
//  Created by 윤지영 on 18/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class History: Codable {
    private var purchases: [Beverage]

    init(purchases: [Beverage]) {
        self.purchases = purchases
    }

    convenience init() {
        self.init(purchases: [])
    }

    func update(purchase beverage: Beverage) {
        purchases.append(beverage)
    }

    func isEmpty() -> Bool {
        return purchases.isEmpty
    }

    func showList(with show: (Int, String) -> Void) {
        for (index, purchase) in purchases.enumerated() {
            show(index + 1, purchase.title)
        }
    }

}

extension History: Equatable {

    static func == (lhs: History, rhs: History) -> Bool {
        return lhs.purchases == rhs.purchases
    }

}
