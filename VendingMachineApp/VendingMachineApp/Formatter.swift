//
//  Formatter.swift
//  VendingMachineApp
//
//  Created by oingbong on 16/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct Formatter {
    public static func format(with beverages: [Beverage]) -> String {
        return "\(beverages.count)\(SeveralUnit.count)"
    }
    
    public static func format(with balance: Int) -> String {
        return "\(balance)\(SeveralUnit.won)"
    }
}
