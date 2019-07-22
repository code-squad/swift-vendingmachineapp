//
//  Units.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Units: String, CustomStringConvertible{
    case millilter
    case milligram
    case gram
    var description: String {
        switch self {
        case .millilter:
            return "ml"
        case .milligram:
            return "mg"
        case .gram:
            return "g"
        }
    }
}
