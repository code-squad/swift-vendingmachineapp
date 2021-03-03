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
    
    /// 지금과, date를 second까지 비교, date가 더 미래라면 true, else = false. 낮은 경우의 수로 지금과 date가 동일 시간이어도, false로 처리함.
    func compareNowWith() -> Bool {
        var bool = false
        if Date.init().compare(self) == .orderedAscending {
            bool = true
        }
        
        return bool
    }
    
    func afterDays(days : Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self) ?? Date.init(timeIntervalSince1970: 0)
    }
}
