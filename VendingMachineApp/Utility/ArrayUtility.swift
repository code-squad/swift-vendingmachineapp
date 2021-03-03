//
//  ArrayUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/03.
//

import Foundation

extension Array {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Int] {
        var dict = [Key:Int]()
        for element in self {
            let key = selectKey(element)
            if let value = dict[key] {
                dict.updateValue(value + 1, forKey: key)
            }else {
                dict[key] = 1
            }
        }
        return dict
    }
}
