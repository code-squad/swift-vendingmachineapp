//
//  DateExtension.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

extension Date {
    static func convert(days: Int) -> TimeInterval {
        return TimeInterval(days * 86400)
    }
    
    static func convert(weeks: Int) -> TimeInterval {
        return convert(days: 7) * Double(weeks)
    }
    
    static func convert(months: Int) -> TimeInterval {
        return convert(days: 30) * Double(months)
    }
    
    static func convert(years: Int) -> TimeInterval {
        return convert(months: 12) * Double(years)
    }
    
    var readable: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
}
