//
//  GlobalFunctions.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

func generateDate(year newYear: Int, month newMonth: Int, day newDay: Int) -> Date {
    var dateComponents = DateComponents()
    dateComponents.year = newYear
    dateComponents.month = newMonth
    dateComponents.day = newDay
    dateComponents.timeZone = TimeZone(abbreviation: "JST")
    
    let userCalendar = Calendar(identifier: .gregorian)
    guard let someDateTime = userCalendar.date(from: dateComponents) else { return Date(timeIntervalSinceReferenceDate: -123456789.0)}
    
    return someDateTime
}
