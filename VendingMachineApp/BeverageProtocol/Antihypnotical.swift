//
//  Antihypnotical.swift
//  VendingMachine
//
//  Created by hw on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 각성효과 프로토콜
protocol Antihypnotical {
    func hasCoffeine() -> Bool
    var coffeineDisplay: Double  { get }
}

extension Antihypnotical {
    func hasCoffeine() -> Bool {
        let isArousal = coffeineDisplay > 0 ? true : false
        return isArousal
    }
}
