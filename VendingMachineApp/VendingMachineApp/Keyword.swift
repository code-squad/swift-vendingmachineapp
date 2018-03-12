//
//  Keywords.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 12..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import Foundation

struct Keyword {
    enum UserInfo : String {
        case inventory = "inventory"
        case balance = "balance"
    }
    
    enum NotificationName : String {
        case didUpdateInventory = "didUpdateInventory"
        case didUpdateBalance = "didUpdateBalance"
    }
}

extension Notification.Name {
    static let didUpdateInventory = Notification.Name(Keyword.NotificationName.didUpdateInventory.rawValue)
    static let didUpdateBalance = Notification.Name(Keyword.NotificationName.didUpdateBalance.rawValue)
}
