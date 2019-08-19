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
    
    //MARK: NSCoding
    
    struct PropertyKey {
        static let beverageTemperature = "beverageTemperature"
        static let expirationPeriod = "expirationPeriod"
        static let manufactureDates = "manufactureDates"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(beverageTemperature, forKey: PropertyKey.beverageTemperature)
        coder.encode(expirationPeriod, forKey: PropertyKey.expirationPeriod)
        coder.encode(manufactureDates, forKey: PropertyKey.manufactureDates)
    }
    
    required convenience init?(coder: NSCoder) {
        let beverageTemperature = coder.decodeInteger(forKey: PropertyKey.beverageTemperature)
        let expirationPeriod = coder.decodeDouble(forKey: PropertyKey.expirationPeriod)
        guard let manufactureDates = coder.decodeObject(forKey: PropertyKey.manufactureDates) as? Date else {
            return nil
        }
        self.init(beverageTemperature: beverageTemperature, expirationPeriod: expirationPeriod, manufactureDates: manufactureDates)
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
