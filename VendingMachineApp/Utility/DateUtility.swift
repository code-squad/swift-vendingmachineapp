//
//  DateUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

extension Date {
    static func getDate(with str : String) -> Date{
        let dateFormatter = setDateFormat(with: "yyyyMMdd")
        let date = dateFormatter.date(from: str) ?? Date()
        return date
    }
    
    static func setDateFormat(with str : String) -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = str
        return dateFormatter
    }
    static func toString(date : Date) -> String{
        let dateFormatter = setDateFormat(with: "yyyyMMdd")
        return dateFormatter.string(from: date)
    }
}
