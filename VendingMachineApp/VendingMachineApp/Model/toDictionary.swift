//
//  toDictionary.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/06.
//

import Foundation

extension Array {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:[Element]] {
        var dict = [Key:[Element]]()
        
        for element in self {
            if let sameKey = dict[selectKey(element)] {
                var arr = sameKey
                arr.append(element)
                dict[selectKey(element)] = arr
            } else {
                dict[selectKey(element)] = [element]
            }
        }
        return dict
    }
}
