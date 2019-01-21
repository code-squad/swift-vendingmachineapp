//
//  ExtensionNotificationName.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 17..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let didChangeNumberOfProduct = Notification.Name("didChangeNumberOfProduct")
    static let didChangeBalance = Notification.Name("didChangeBalance")
    static let didChangeHistoryOfPurchase = Notification.Name("didChangeHistoryOfPurchase")
}
