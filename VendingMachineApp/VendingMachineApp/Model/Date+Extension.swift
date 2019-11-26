//
//  Date+Extension.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    init(_ dateString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let date = formatter.date(from: dateString) ?? Date()
        
        self = date
    }
    
    var text: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        return formatter.string(from: self)
    }
}
