//
//  DateInterval.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 14..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

enum DateInterval: TimeInterval {
    case today = 32_400
    case year = 31_536_000
    case twoDays = 172_800
    case oneWeek = 604_800
}

enum MenuSelectorUser: Int {
    case insertMode = 1
    case purchaseMode = 2
}

enum MenuSelectorAdmin: Int {
    case addstock = 1
    case removeStock = 2
}

enum ModeSelector: Int {
    case adminMode = 1
    case userMode = 2
}
