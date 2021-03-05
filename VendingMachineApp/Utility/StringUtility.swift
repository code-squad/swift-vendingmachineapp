//
//  StringUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

extension String {
    func toDate() -> Date{
        let dateFormatter = Date.setDateFormat(with: "yyyyMMdd")
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
    func extractUnsignedInteger() -> Int {
        let stringArray = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        for item in stringArray {
            if let number = Int(item) {
                return number
            }
        }
        return 0
    }
}
