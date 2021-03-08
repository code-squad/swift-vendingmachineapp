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
    func isExpired() -> Bool {
        let calendar = Calendar.current
        return calendar.compare(self, to: Date(), toGranularity: .day) == .orderedAscending
    }
}
