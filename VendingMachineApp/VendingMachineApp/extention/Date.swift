//
//  Date.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

extension Date {
    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
    
    /// at least before 1 day
    func createRandomIn7days() -> Date {
        return Date.init(timeIntervalSinceNow: TimeInterval.random(in: (-3600 * 24 * 7)..<(-3600 * 24)))
    }
}
