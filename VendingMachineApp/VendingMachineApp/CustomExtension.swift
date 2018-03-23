//
//  CustomExtension.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

// MARK: Extension Date type

extension Date {
    // 지정한 형태로 출력하기위한 description 속성
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        return dateFormatter.string(from: self)
    }

    init(yyyyMMdd: String) {
        // dateFormatter 초기화
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        // 입력된 String으로 Date생성
        self = dateFormatter.date(from: yyyyMMdd) ?? Date()
    }

    func isOutOfDate(validDuration: Int) -> Bool {
        let currentDate = Date() // 오늘날짜(프로그램 실행날짜) 구하기

        // 파라미터로 받은 사용기한(validDuration)을 통해 유통기한 계산
        let expiration = Calendar.current.date(byAdding: .day, value: validDuration, to: self) ?? Date()

        // 사용기한 + 제조일자 > 오늘날짜 = true
        return currentDate < expiration
    }

    // History에서 사용하기위해 Local시간을 날짜와 함께 문자열로 리턴
    func getDateWithLocalTime() -> String {
        let formatter = DateFormatter()
        formatter.formatterBehavior = .behavior10_4
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ko_KR")

        return formatter.string(from: self)
    }

}

// MARK: Extension Dictionary

extension Dictionary {
    func update(other: Dictionary) -> Dictionary {
        var newSet = self
        for (key, value) in other {
            newSet.updateValue(value, forKey: key)
        }
        return newSet
    }
}

// MARK: Extension String

extension String{
    init(balanceFormat: Int) {
        self = String(format: "\(balanceFormat) 원", balanceFormat)
    }
}
