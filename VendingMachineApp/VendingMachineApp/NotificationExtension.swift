//
//  NotificationExtension.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/04.
//

import Foundation

extension Notification.Name {
    static let didIncreaseMoneyOnTransaction = Notification.Name("didChangeMoneyOnTransaction")
    static let didIncreaseStock = Notification.Name("didIncreaseStock")
}
