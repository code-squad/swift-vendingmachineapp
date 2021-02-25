//
//  Date+DateFormatter.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

extension Date {
    
    static private let dateFormatter = DateFormatter()
    static private let validFormat: String = "yyyyMMdd"
    
    static func getString(from date: Date?) -> String? {
        dateFormatter.dateFormat = validFormat
        if let date = date {
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    static func getDate(from dateString: String) -> Date? {
        dateFormatter.dateFormat = validFormat
        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }
        return date
    }
}
