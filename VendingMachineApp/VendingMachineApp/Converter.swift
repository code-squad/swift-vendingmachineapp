//
//  Converter.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct DateConverter {
    static func stringToDate(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        if let date = dateFormatter.date(from: string) {
            return date
        }
        
        return Date.init()
    }
    
    static func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        return dateFormatter.string(from: date)
    }
}
