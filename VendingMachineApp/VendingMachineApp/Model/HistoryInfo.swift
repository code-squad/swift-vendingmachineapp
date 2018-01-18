//
//  HistoryInfo.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// 구입이력 포맷.
struct HistoryInfo: Codable {
    private(set) var purchasingDate: Date
    private(set) var purchasedMenu: String
    private(set) var count: Purchased
}
