//
//  File.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 15..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let beverageCounts = Notification.Name(Keyword.Key.beverageCounts.value)
    static let coins = Notification.Name(Keyword.Key.coins.value)
    static let purchase = Notification.Name(Keyword.Key.purchase.value)
}
