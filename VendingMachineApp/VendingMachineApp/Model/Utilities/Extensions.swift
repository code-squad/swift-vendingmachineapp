//
//  EnumExtension.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 19..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

// EnumCollection을 채택한 타입은 Hashable도 구현해야 함. Enum은 이미 Hashable이므로 hashValue를 따로 구현해줄 필요 없음.
protocol EnumCollection: Hashable {
    // sequence를 array로 타입캐스팅하여 반환.
    static var allValues: [Self] { get }
}

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

extension Dictionary where Value == Int {
    // 딕셔너리 값이 Int인 경우, 결과값을 누적해서 업데이트 가능.
    mutating func update(forKey key: Key, _ isAdded: Bool) -> [Key:Value] {
        var newDictionary = self
        var newValue: Int = 0
        // 해당 키의 기존 값이 있는 경우.
        if let prevNumberCount = self[key] {
            // isAdded 상태에 따라 +/-1
            if isAdded {
                newValue = prevNumberCount+1
            } else {
                newValue = prevNumberCount-1
            }
        } else {
            // 첫 값인 경우, 해당 키의 값에 1 저장.
            newValue = 1
        }
        newDictionary.updateValue(newValue, forKey: key)
        return newDictionary
    }
}
