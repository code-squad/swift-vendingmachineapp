//
//  ViewIdentifier.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class ViewIdentifier {
    static func findBalanceButton(by tag: Int) -> Identifier.BalanceButton? {
        return Identifier.BalanceButton(rawValue: tag)
    }
    
    static func findBeverageButton(by tag: Int) -> Identifier.BeverageButton? {
        return Identifier.BeverageButton(rawValue: tag)
    }
    
    static func findLabel(by tag: Int) -> Identifier.Label? {
        return Identifier.Label(rawValue: tag)
    }
}

class Identifier {
    enum Label: Int {
        case coke = 101
        case fanta, strawberryMilk, chocolateMilk, georgia, top
        
        var type: String {
            switch self {
            case .coke: return "Coke"
            case .fanta: return "Fanta"
            case .strawberryMilk: return "StrawberryMilk"
            case .chocolateMilk: return "ChocolateMilk"
            case .georgia: return "Georgia"
            case .top: return "Top"
            }
        }
    }

    enum BeverageButton: Int {
        case coke = 201
        case fanta, strawberryMilk, chocolateMilk, georgia, top
    }
    
    enum BalanceButton: Int {
        case thousand = 207
        case fiveThousand
        
        var money: Int {
            switch self {
            case .thousand: return 1000
            case .fiveThousand: return 5000
            }
        }
    }
}
