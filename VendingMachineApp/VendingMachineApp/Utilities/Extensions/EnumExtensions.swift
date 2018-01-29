//
//  EnumExtension.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// enum 내부 값을 배열로 가져오는 확장 기능.
// [출처](https://theswiftdev.com/2017/10/12/swift-enum-all-values/)
extension EnumCollection {
    // 시퀀스를 배열로 캐스팅 후 반환.
    static var allValues: [Self] {
        return Array(cases())
    }

    // 내부 값의 시퀀스 반환.
    private static func cases() -> AnySequence<Self> {
        // 전체 요소를 시퀀스로 만들어 반환.
        return AnySequence { () -> AnyIterator<Self> in
            var hash = 0
            return AnyIterator {
                defer { hash += 1 }
                let currentElement = withUnsafePointer(to: &hash) {
                    $0.withMemoryRebound(to: Self.self, capacity: 1) { $0.pointee }
                }
                guard currentElement.hashValue == hash else { return nil }
                return currentElement
            }
        }
    }

}
