//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 김성현 on 19/08/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    
    var beverageTemperature: Int
    var expirationPeriod: TimeInterval
    var manufactureDates: Date
    
    init(beverageTemperature: Int, expirationPeriod: TimeInterval, manufactureDates: Date) {
        self.beverageTemperature = beverageTemperature
        self.expirationPeriod = expirationPeriod
        self.manufactureDates = manufactureDates
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
    
    var expirationDate: Date {
        return manufactureDates + expirationPeriod
    }
    
    func isExpired(targetDate: Date = Date()) -> Bool {
        return expirationDate > targetDate
    }
}
