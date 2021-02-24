//
//  DateUtility.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/24.
//

import Foundation

enum DateError: Error {
    case invalidInputFormat(validFormat: String)
}

struct DateUtility {
    
    static private let dateFormatter = DateFormatter()
    static private let validFormat: String = "yyyyMMdd"
    
    static func getString(from date: Date) -> String {
        dateFormatter.dateFormat = validFormat
        return dateFormatter.string(from: date)
    }
    
    static func getDate(from dateString: String) throws -> Date {
        dateFormatter.dateFormat = validFormat
        guard let date = dateFormatter.date(from: dateString) else {
            throw DateError.invalidInputFormat(validFormat: validFormat)
        }
        return date
    }
}
