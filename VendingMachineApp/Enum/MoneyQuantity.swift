//
//  MoneyQuantity.swift
//  VendingMachineApp
//
//  Created by hw on 24/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

enum MoneyQuantity: Int, CustomStringConvertible{
    case oneThousand = 1000
    case fiveThousand = 5000
    
    var description: String {
        switch self{
        case .oneThousand:
            return "\(self.rawValue)"
        case .fiveThousand:
            return "\(self.rawValue)"
        }
    }
}
