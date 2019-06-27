//
//  BeverageType.swift
//  VendingMachineApp
//
//  Created by Elena on 27/06/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import Foundation

// MARK: enum BeverageType
enum BeverageType: Int, CaseIterable{
    case banana = 0
    case cantata
    case coca
    case choco
    case starbucks
    
    var type: Beverage.Type {
        switch self {
        case .banana:
            return BananaMilk.self
        case .cantata:
            return CantataCoffee.self
        case .coca:
            return CocaCola.self
        case .choco:
            return ChocolateMilk.self
        case .starbucks:
            return StarbucksCoffee.self
        }
    }
}
