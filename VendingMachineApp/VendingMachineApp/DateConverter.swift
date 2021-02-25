//
//  DateConverter.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

class DateConverter {
    
    static public func toString(_ date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        
        return format.string(from: date)
    }
}
