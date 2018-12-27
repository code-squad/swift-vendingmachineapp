//
//  VendingMachineMode.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 25..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum VendingMachineMode: String {
    case manager = "1"
    case user = "2"
    case back = "3"

    func isEqual(input: String) -> Bool {
        return input == self.rawValue
    }
}
