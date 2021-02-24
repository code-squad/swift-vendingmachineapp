//
//  Date.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/24.
//

import Foundation

extension Date {
        static func change(_ date: String) -> Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if dateFormatter.date(from: date) != nil {
                return dateFormatter.date(from: date)!
            }
        }
}
