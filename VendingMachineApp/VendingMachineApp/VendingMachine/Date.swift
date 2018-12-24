//
//  Date.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

extension Double {

    func convertDaysIntoSeconds() -> TimeInterval {
        let secondsOfADay: Double = 86400
        return self * secondsOfADay
    }

}

extension Date {

    func addingDayInterval(_ days: Double) -> Date {
        let dayInterval = days.convertDaysIntoSeconds()
        return self.addingTimeInterval(dayInterval)
    }

    static func subtractingDaysFromNow(by days: Double) -> Date {
        let dayInterval = -1 * days.convertDaysIntoSeconds()
        let now = Date()
        return Date(timeInterval: dayInterval, since: now)
    }

}
