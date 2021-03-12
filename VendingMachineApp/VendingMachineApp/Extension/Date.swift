//
//  Date.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/25.
//

import Foundation

extension Date {
    
    func toString(format: String = "yyyyMMdd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
}
