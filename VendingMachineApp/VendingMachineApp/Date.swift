//
//  Date.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

extension Date{
    func stringTodate(_ stringdate : String) -> Date {
        return Date().makeDateFormatter().date(from: stringdate) ?? Date()
    }
    
    func descriptDateToString() -> String{
        return "\(self.makeDateFormatter().string(from: self))"
    }
    
    private func makeDateFormatter() -> DateFormatter{
        let tempdateFormatter = DateFormatter()
        tempdateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        tempdateFormatter.dateFormat = "yyyyMMdd"
        return tempdateFormatter
    }
    
    func expiration(_ date : Int, manufactured : Date) -> Date{
        let expiration = Calendar.current.date(byAdding: .day, value: date, to: manufactured)
        return expiration ?? Date()
    }
}
