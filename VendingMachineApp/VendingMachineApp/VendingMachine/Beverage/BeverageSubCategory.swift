//
//  BeverageSubCategory.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 02/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import Foundation

enum BeverageSubCategory: Int, CaseIterable, Codable{
    case chocolateMilk = 0, strawberryMilk
    case sprite, pepsi
    case cantata, georgia

    var type: Beverage.Type {
        switch self {
        case .chocolateMilk:
            return ChocolateMilk.self
        case .strawberryMilk:
            return StrawberryMilk.self
        case .sprite:
            return Sprite.self
        case .pepsi:
            return Pepsi.self
        case .cantata:
            return Cantata.self
        case .georgia:
            return Georgia.self
        }
    }
}
