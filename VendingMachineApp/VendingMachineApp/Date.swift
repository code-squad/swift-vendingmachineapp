//
//  Date.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

extension Date {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter
    }()
    
    static func input(_ date: String) -> Date {
        return Date.dateFormatter.date(from: date) ?? Date()
    }
    var anotherDescription: String {
        return "\(Date.dateFormatter.string(from: self))"
    }
    
}
