//
//  ViewIdentifier.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class ViewIdentifier {
    static func findLabel(by tag: Int) -> Identifier.Label? {
        return Identifier.Label(rawValue: tag)
    }
    
    static func findButton(by tag: Int) -> Identifier.Button? {
        return Identifier.Button(rawValue: tag)
    }
}

class Identifier {
    enum Label: Int {
        case coke = 101
        case fanta, strawberryMilk, chocolateMilk, georgia, top
    }

    enum Button: Int {
        case coke = 201
        case fanta, strawberryMilk, chocolateMilk, georgia, top
        case thousand, fiveThousand
        
        var money: Int? {
            switch self {
            case .thousand: return 1000
            case .fiveThousand: return 5000
            default: return nil
            }
        }
    }
}
