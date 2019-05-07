//
//  Date.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    //출력을 위해 날짜 변경 해주는 함수
    static func changeDate(beforeDate: Date) -> String {
        let dataForm = DateFormatter()
        dataForm.dateFormat = "yyyyMMdd"
        let afterDate = dataForm.string(from: beforeDate)
        return afterDate
    }

    // String으로 날짜를 받았을때 Date로 변경 해주는 함수
    static func changeString(beforeString: String) -> Date {
        let dateString: String = beforeString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        let date: Date = dateFormatter.date(from: dateString) ?? Date()

        return date
    }

    // Date으로 날짜를 받았을때 시간 삭제하는 포멧으로 변경 해주는 함수
    static func cutDateFormatter(beforeDate: Date) -> Date {
        let dateString: String = changeDate(beforeDate: beforeDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        let date: Date = dateFormatter.date(from: dateString) ?? Date()

        return date
    }

    // 날짜에서 몇일뒤의 날짜를 반환해주는 함수
    static func addDate(endDate: ExpirationPeriod, day: Date) -> Date {
        let addSecond = endDate.endDateSecond()
        let afterDate = Date.init(timeInterval: TimeInterval(addSecond), since: day)
        return afterDate
    }

    // 날짜 비교
    static func isEqualDate(manufacturedDate: Date) -> Bool {

        let nowDate = cutDateFormatter(beforeDate: Date())
        if manufacturedDate < nowDate {
            return false
        }
        return true
    }
}
