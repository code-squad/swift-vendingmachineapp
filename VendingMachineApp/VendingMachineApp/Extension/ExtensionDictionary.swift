//
//  ExtensionDictionary.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 18..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable {
    func key(for value: Value) -> Key? {
        return first { $0.value == value }?.key
    }
}
