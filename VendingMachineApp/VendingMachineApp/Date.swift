//
//  Date.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

extension Date{
    func stringTodate(_ stringdate : String) -> Date {
        let tempdateFormatter = DateFormatter()
        tempdateFormatter.dateFormat = "yyyyMMdd"
        tempdateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return tempdateFormatter.date(from: stringdate) ?? Date()
    }
    
    func yyyyMMddFormat(date : Date) -> String{
        let tempdateFormatter = DateFormatter()
        tempdateFormatter.dateFormat = "yyyyMMdd"
        return "\(tempdateFormatter.string(from: date))"
    }
    
    func expiration(_ date : Int, manufactured : Date) -> Date{
        let expiration = Calendar.current.date(byAdding: .day, value: date, to: manufactured)
        return expiration ?? Date()
    }
}
