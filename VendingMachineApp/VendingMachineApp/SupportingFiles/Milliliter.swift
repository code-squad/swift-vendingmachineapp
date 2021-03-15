////
////  Milli-Liter.swift
////  VendingMachineApp
////
////  Created by 조중윤 on 2021/02/26.
////
//
//import Foundation
//
//class Int: NSObject, NSCoding, ExpressibleByIntegerLiteral {
//    private let value: Int
////    private let inLiter: Float
//
//    init(with integer: Int) {
//        self.value = integer
////        self.inLiter = Float(round(Double(value) / 10) / 100)
//    }
//
//    required init(integerLiteral val: Int) {
//        self.value = val
////        self.inLiter = Float(round(Double(value) / 10) / 100)
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(value, forKey: "value")
////        coder.encode(inLiter, forKey: "inLiter")
//    }
//
//    required init?(coder eDecoder: NSCoder) {
//        value = eDecoder.decodeInteger(forKey: "value")
////        value = eDecoder.decodeInteger(forKey: "inLiter")
//    }
//
////    public func showInLiter() -> Float {
////        return inLiter
////    }
//}
//
////extension Int: Equatable & Hashable {
////    static func == (lhs: Int, rhs: Int) -> Bool {
////        return lhs.value == rhs.value
////    }
////    func hash(into hasher: inout Hasher) {
////        hasher.combine(value)
////    }
////}
//
