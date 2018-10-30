//
//  Deposit.swift
//  VendingMachineApp
//
//  Created by 이동건 on 30/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import Foundation

enum DepositType {
    enum Thousand {
        var value: Int {
            switch self {
            case .one:
                return 1000
            case .five:
                return 5000
            }
        }
        case one
        case five
    }
}
