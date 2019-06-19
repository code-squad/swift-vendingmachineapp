//
//  ExpirationPeriod.swift
//  VendingMachine
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ExpirationPeriod:  NSObject{
    private let endDay: Int

    init(endDay: Int) {
        self.endDay = endDay
    }

    func endDateSecond() -> Int {
        let addSecond = 86400 * endDay
        return addSecond
    }
    
    func getterInt() -> Int {
        return self.endDay
    }
    
    // MARK: - NSSecureCoding
    enum ExpirationCodingKeys : String, CodingKey{
        case endDay
    }
    
    required init?(coder aDecoder: NSCoder) {
        let endDay = aDecoder
            .decodeObject(of: NSNumber.self, forKey: ExpirationCodingKeys.endDay.rawValue) ?? 0
        self.endDay = endDay.intValue
    }

}

extension ExpirationPeriod: NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(NSNumber(value: endDay), forKey: ExpirationCodingKeys.endDay.rawValue)
    }
}
