//
//  DateExtension.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

extension Date {
    func formatted(to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = to
        return dateFormatter.string(from: self)
    }
}
