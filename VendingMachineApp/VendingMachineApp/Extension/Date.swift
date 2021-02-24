//
//  ate.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

extension Date {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    func date(_ date: String) -> Date {
        return Date.formatter.date(from: date) ?? Date()
    }
    
    var description: String {
        return "\(Date.formatter.string(from: self))"
    }
}
