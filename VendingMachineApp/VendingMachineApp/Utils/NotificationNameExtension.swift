//
//  NotificationNameExtension.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let balanceDidChange = Notification.Name("balanceDidChange")
    static let inventoryDidChange = Notification.Name("inventoryDidChange")
}
