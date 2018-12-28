//
//  ReadableInventory.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 28..
//  Copyright © 2018 hngfu. All rights reserved.
//

import Foundation

protocol ReadableInventory {
    func inventory() -> [String: Int]
}
