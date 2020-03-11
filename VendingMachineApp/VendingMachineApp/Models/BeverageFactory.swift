//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class BeverageFactory {
    static func make(by identifier: Identifier.BeverageButton) -> Beverage {
        switch identifier {
        case .coke: return Coke()
        case .fanta: return Fanta()
        case .strawberryMilk: return StrawberryMilk()
        case .chocolateMilk: return ChocolateMilk()
        case .georgia: return Georgia()
        case .top: return Top()
        }
    }
}
