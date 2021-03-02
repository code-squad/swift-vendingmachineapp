//
//  ConvertDate.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/25.
//

import Foundation

extension Date {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter
    }()
    
    static func convertToDate(_ date: String) -> Date {
        return Date.dateFormatter.date(from: date) ?? Date()
    }
    var description: String {
        return "\(Date.dateFormatter.string(from: self))"
    }
}
