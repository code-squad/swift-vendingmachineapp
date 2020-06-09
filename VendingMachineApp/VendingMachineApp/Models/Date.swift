//
//  Date.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

extension Date {
    static let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    var toStringYearMonthDay: String {
        return Date.dateFormatter.string(from: self)
    }
}
