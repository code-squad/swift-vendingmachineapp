//
//  DateExtension.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
}
