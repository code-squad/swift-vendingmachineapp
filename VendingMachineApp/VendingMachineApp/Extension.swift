//
//  Extension.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/26.
//

import Foundation

extension Date {
    
    func stringToDate(date: String) -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        var targetDate = Date()
        if let someDate = dateFormat.date(from: date) {
            targetDate = someDate
        }
        return targetDate
    }
    
}
