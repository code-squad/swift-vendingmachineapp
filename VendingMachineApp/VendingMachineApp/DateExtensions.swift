//
//  DateGenerator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

extension Date {
    
    func fromString(_ string: String, format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let date = formatter.date(from: string)
        
        return date ?? Date()
    }
    
    func inFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    func add(amount: Int) -> Date {
        let expiryDate = Calendar.current.date(byAdding: .day,
                                               value: amount,
                                               to: self)
        return expiryDate ?? self
    }
}

