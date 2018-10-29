//
//  NotificationName.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

enum VendingMachineNotification {
    
    var name: Notification.Name {
        switch self {
        case .didAdd:
            return Notification.Name("beverageDidAdd")
        case .didRemove:
            return Notification.Name("beverageDidRemove")
        }
    }
    
    case didAdd
    case didRemove
}
