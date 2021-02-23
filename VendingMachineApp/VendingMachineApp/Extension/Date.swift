//
//  Date.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//
import Foundation

extension Date {
    
    static let dateFommater : DateFormatter = {
        let datefommater = DateFormatter()
        datefommater.dateFormat = "yyyyMMdd"
        return datefommater
    }()
    
    var description : String {
        return "\(Date.dateFommater.string(from: self))"
    }
}
