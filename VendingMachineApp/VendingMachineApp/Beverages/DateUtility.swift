//
//  DateUtility.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 6. 29..
//  Copyright © 2018년 김수현. All rights reserved.
//

import Foundation

struct DateUtility {
    
    static func formatDate(_ format: String) -> DateFormatter {
        let expirationDate = DateFormatter()
        expirationDate.dateFormat = format
        return expirationDate
    }
    
    static func makeToday() -> Date {
        return Date(timeIntervalSinceNow: 0)
    }
    
}
