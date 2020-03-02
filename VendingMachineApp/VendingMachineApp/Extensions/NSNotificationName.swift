//
//  NSNotificationName.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/03/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    static let BalanceDidChange = NSNotification.Name(rawValue: "BalanceDidChangeNotification")
    static let StockNumberDidChange = NSNotification.Name(rawValue: "StockNumberDidChangeNotifiaction")
}
