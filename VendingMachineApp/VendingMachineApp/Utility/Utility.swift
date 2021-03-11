//
//  Date.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/22.
//

import Foundation


extension Date {
    
    func getStringFromDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
}

extension String {
    
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
    
    func extractIntegerFromString() -> Int {
        let stringArray = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        
        for element in stringArray {
            if let num = Int(element) {
                return num
            }
        }
        return 0
    }
}
