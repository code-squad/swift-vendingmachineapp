//
//  Utility.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

extension Date {
    static func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
}
