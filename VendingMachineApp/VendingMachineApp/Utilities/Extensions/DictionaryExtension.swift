//
//  DictionaryExtension.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

extension Dictionary where Value == Int {
    // 딕셔너리 값이 Int인 경우, 결과값을 누적해서 업데이트 가능.
    func update(amount: Int, forKey key: Key, _ isAdded: Bool) -> [Key:Value] {
        var newDictionary = self
        var newValue: Int = 0
        // 해당 키의 기존 값이 있는 경우.
        if let prevNumberCount = self[key] {
            // isAdded 상태에 따라 +/-1
            if isAdded {
                newValue = prevNumberCount+amount
            } else {
                newValue = prevNumberCount-amount
            }
        } else {
            // 첫 값인 경우, 해당 키의 값에 1 저장.
            newValue = amount
        }
        newDictionary.updateValue(newValue, forKey: key)
        return newDictionary
    }
}
