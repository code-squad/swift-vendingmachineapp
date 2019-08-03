//
//  VendingMachineNotification.swift
//  VendingMachineApp
//
//  Created by hw on 02/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let notifyDrinkStockSizeUpdate = Notification.Name(rawValue: "notifyDrinkStockSizeUpdate")
    static let notifyBalanceInfoUpdate = Notification.Name(rawValue: "notifyBalanceInfoUpdate")
    static let notifyShoppingHistory = Notification.Name(rawValue: "notifyShoppingHistory")
    static let notifySellingResult = Notification.Name(rawValue: "notifySellingResult")
}
