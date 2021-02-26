//
//  Date.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
}
