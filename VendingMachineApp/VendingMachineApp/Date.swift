//
//  Date.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

extension Date{
    func returnStringDate(_ stringdate : String) -> Date {
        let tempdateFormatter = DateFormatter()
        tempdateFormatter.dateFormat = "yyyyMMdd"
        return tempdateFormatter.date(from: stringdate) ?? Date()
    }
}
