//
//  staticProperties.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 14..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let didUpdateStock = Notification.Name("didUpdateStock")
    static let didUpdateBalance = Notification.Name("didUpdateBalance")
    static let didUpdateInventory = Notification.Name("didUpdateInventory")
    static let didUpdateRecord = Notification.Name("didUpdateRecord")
}

enum UserInfoKeys: String, CustomStringConvertible {
    case purchasedBeverage
    case addedRecord
    var description: String {
        return self.rawValue
    }
}
