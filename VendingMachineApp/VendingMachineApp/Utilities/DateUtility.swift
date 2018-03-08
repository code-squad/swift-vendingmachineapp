//
//  DateUtility.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct DateUtility {
    static func formatDate(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter
    }

    static func today() -> Date {
        return Date(timeIntervalSinceNow: 0)
    }

    static func addDays(_ day: Double) -> Date {
        return Date(timeInterval: day*86400, since: today())
    }

    static func subtractDays(_ day: Double) -> Date {
        return Date(timeInterval: -day*86400, since: today())
    }
}
