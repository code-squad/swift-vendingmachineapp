//
//  DrinkName.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

enum DrinkName: Int {
    case strawBerryMilk, bananaMilk, chocolateMilk
    case coke, cider, fanta
    case cantataCoffee, topCoffee, georgiaCoffee

    static let allRawValues = DrinkName.strawBerryMilk.rawValue...DrinkName.georgiaCoffee.rawValue
    static let allCases = Array(allRawValues.map { DrinkName(rawValue: $0)! })
}

extension DrinkName: CustomStringConvertible {
    var description: String {
        switch self {
        case .strawBerryMilk:
            return "strawBerryMilk"
        case .bananaMilk:
            return "bananaMilk"
        case .chocolateMilk:
            return "chocolateMilk"
        case .coke:
            return "coke"
        case .cider:
            return "cider"
        case .fanta:
            return "fanta"
        case .cantataCoffee:
            return "cantataCoffee"
        case .topCoffee:
            return "topCoffee"
        case .georgiaCoffee:
            return "georgiaCoffee"
        }
    }
}
