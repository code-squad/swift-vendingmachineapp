//
//  Utility.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import Foundation

struct Utility {
    static public func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
