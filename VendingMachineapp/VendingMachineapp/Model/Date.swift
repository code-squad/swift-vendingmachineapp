//
//  Date.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import Foundation

extension Date {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    func stringToDate(date: String) -> Date {
        return Date.dateFormatter.date(from: date) ?? Date()
    }
    
    var description: String {
        return "\(Date.dateFormatter.string(from: self))"
    }
}
