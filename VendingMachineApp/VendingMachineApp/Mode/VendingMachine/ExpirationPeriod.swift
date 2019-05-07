//
//  ExpirationPeriod.swift
//  VendingMachine
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ExpirationPeriod {
    private let endDay: Int

    init(endDay: Int) {
        self.endDay = endDay
    }

    func endDateSecond() -> Int {
        let addSecond = 86400 * endDay
        return addSecond
    }
}
