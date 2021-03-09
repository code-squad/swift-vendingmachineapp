//
//  Milli-Liter.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

struct Milliliter: ExpressibleByIntegerLiteral {
    private let value: Int
    private let inLiter: Float
    
    
    init(with integer: Int) {
        self.value = integer
        self.inLiter = Float(round(Double(value) / 10) / 100)
    }
    
    init(integerLiteral val: Int) {
        self.value = val
        self.inLiter = Float(round(Double(value) / 10) / 100)
    }
    
    public func showInLiter() -> Float {
        return inLiter
    }
}

extension Milliliter: Equatable & Hashable {
    static func == (lhs: Milliliter, rhs: Milliliter) -> Bool {
        return lhs.value == rhs.value
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

