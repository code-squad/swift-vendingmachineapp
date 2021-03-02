//
//  Date.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
}
