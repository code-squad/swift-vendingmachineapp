//
//  Notification+Name.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/12.
//

import Foundation

extension NSNotification.Name {
    static let stockChanged = Notification.Name("stockChanged")
    static let balanceChanged = Notification.Name("balanceChanged")
}
