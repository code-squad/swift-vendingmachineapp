//
//  NotificationExtension.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/10.
//

import Foundation

extension Notification.Name {
    static let StockCountChanged = Notification.Name("StockCountChanged")
    static let CoinChanged = Notification.Name("CoinChanged")
}
