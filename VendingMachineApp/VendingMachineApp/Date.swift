//
//  Date.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

extension Date {
    
    func toString() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        
        return format.string(from: self)
    }
}
