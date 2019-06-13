//
//  ExpirationPeriod.swift
//  VendingMachine
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ExpirationPeriod:  NSObject, Codable{
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
    
    // MARK: - Codable
    // enum
    enum ExpirationCodingKeys : String, CodingKey{
        case endDay
    }
    
    init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: ExpirationCodingKeys.self)
        endDay = try value.decode(Int.self, forKey: .endDay)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ExpirationCodingKeys.self)
        try container.encode(endDay, forKey: .endDay)
    }
}
