//
//  Coins.swift
//  VendingMachineApp
//
//  Created by TaeHyeonLee on 2018. 1. 2..
//  Copyright © 2018년 ChocOZerO. All rights reserved.
//

import Foundation

enum Coins {
    case thousand
    case fiveThousand

    var value: Int {
        switch self {
        case .thousand:
            return 1000
        case .fiveThousand:
            return 5000
        }
    }
}
