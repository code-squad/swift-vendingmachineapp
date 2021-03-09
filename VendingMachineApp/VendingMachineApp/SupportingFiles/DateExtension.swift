//
//  DateExtension.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/25.
//

import Foundation

extension Date {
    func useSimpleFormat(dateFormat: String) -> String {
        let format = DateFormatter()
        format.dateFormat = dateFormat
        return format.string(from: self)
    }
    
    func isOld(after shelfLifeInDay: Double) -> Bool {
        let oneDayInSeconds: Double = 86400
        return Date() >= self.addingTimeInterval(oneDayInSeconds * shelfLifeInDay)
    }
}
