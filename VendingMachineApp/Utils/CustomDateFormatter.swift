//
//  CustomDateFormatter.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CustomDateFormatter {
    
    static func convertDateToString(_ input: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let result = dateFormatter.string(from: input)
        return result
    }
    
    static func convertStringToDate(year: Int, month : Int, day: Int) -> Date {
       let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dDay = dateFormatter.date(from: "\(year)-\(month)-\(day)")
        return dDay!
    }
    
    static func daysAfter(after: Int) -> Date{
        var daysAfter = Date.init()
        daysAfter = daysAfter + TimeInterval(after*24*60*60)
        return daysAfter
    }
}
