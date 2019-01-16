//
//  DateFormat.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct DateFormat {
    static func set() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }
    
    static func convertDate(_ date: String) -> Date {
        return DateFormat.set().date(from: date) ?? Date()
    }
}
