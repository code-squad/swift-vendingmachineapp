//
//  Currency.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
enum Currency: CustomStringConvertible{
    case won
    var description: String {
        switch self {
        case .won:
            return "원"
        }
    }
}
