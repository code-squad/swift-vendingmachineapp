//
//  HistoryInfo.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// 구입이력 포맷.
class HistoryInfo: Codable, CustomStringConvertible {
    private(set) var purchasingDate: Date
    private(set) var purchasedMenu: VendingMachine.Menu
    private(set) var count: Int
    init(purchasingDate: Date, purchasedMenu: VendingMachine.Menu, count: Int) {
        self.purchasingDate = purchasingDate
        self.purchasedMenu = purchasedMenu
        self.count = count
    }

    func updateCount(by addedCount: Int) {
        self.count += addedCount
    }

    var description: String {
        return "구매일자: \(purchasingDate) | 상품이름: \(purchasedMenu.productName) | 구매개수: \(count)개"
    }
}
