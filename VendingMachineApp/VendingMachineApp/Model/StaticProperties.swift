//
//  staticProperties.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 14..
//  Copyright © 2018년 심 승민. All rights reserved.
//

enum NotificationNames: CustomStringConvertible {
    case didUpdateInventory
    case didUpdateBalance
    var description: String {
        switch self {
        case .didUpdateInventory: return "didUpdateInventory"
        case .didUpdateBalance: return "didUpdateBalance"
        }
    }
}
