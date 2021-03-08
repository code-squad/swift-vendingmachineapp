//
//  DateExtension.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/01.
//

import Foundation

extension Date {
    static func converToDate(from string: String) -> Date {
        let manufactureDateFormatter = DateFormatter()
        manufactureDateFormatter.dateFormat = "yyyyMMdd"
        return manufactureDateFormatter.date(from: string)!
    }
    
    var productDisplayFormat: String {
        let manufactureDateFormatter = DateFormatter()
        manufactureDateFormatter.dateFormat = "yyyyMMdd"
        return manufactureDateFormatter.string(from: self)
    }
}
