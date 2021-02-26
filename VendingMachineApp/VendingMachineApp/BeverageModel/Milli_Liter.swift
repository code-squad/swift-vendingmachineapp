//
//  Milli-Liter.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

struct Milli_Liter {
    private let value: Int
    
    init(_ value: Int) {
        self.value = value
    }
}

extension Milli_Liter: Equatable {
    static func == (lhs: Milli_Liter, rhs: Milli_Liter) -> Bool {
        return lhs.value == rhs.value
    }
}
