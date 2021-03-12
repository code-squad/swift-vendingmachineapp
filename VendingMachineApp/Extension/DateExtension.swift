//
//  DateUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

extension Date {
    static func setDateFormat(with str : String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = str
        return dateFormatter
    }
    func toString() -> String {
        let dateFormatter = Date.setDateFormat(with: "yyyyMMdd")
        return dateFormatter.string(from: self)
    }
    func isExpired(to date : Date) -> Bool {
        let calendar = Calendar.current
        return calendar.compare(self, to: date, toGranularity: .day) == .orderedAscending
    }
    func get7daysLatter() -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = 7
        
        let newDate = Calendar.current.date(byAdding: dateComponent, to: self)!
        return newDate
    }
}
