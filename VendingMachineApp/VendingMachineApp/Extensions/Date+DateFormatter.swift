//
//  Date+DateFormatter.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation

extension Date {
    
    var formattedString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
}
