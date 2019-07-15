//
//  DateUtil.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct DateUtil {
    static private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        return dateFormatter
    }()

    /// Date를 String 타입으로 변환하는 메소드
    static func convertDate(of text: String) -> Date {
        return dateFormatter.date(from: text)!
    }

    /// String타입을 Date타입으로 변환하는 메소드
    static func convertText(of date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
