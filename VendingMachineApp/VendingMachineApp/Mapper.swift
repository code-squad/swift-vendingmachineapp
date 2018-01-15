//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 15..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation
import UIKit

struct Mapper {
    // balanceButton의 tag 값과 MoneyManager.Unit 모델에 사용될 값을 매핑
    static func mappingUnit(with sender: UIButton) -> Int {
        var unit = Int()
        switch sender.tag {
        case 1: unit = 100
        case 2: unit = 500
        case 3: unit = 1000
        default: break
        }
        return unit
    }

    static func mappingMenu(with sender: UIButton) -> VendingMachine.Menu {
        var menu: VendingMachine.Menu = .strawberryMilk
        switch sender.tag {
        case 1: menu = .strawberryMilk
        case 2: menu = .bananaMilk
        case 3: menu = .chocoMilk
        case 4: menu = .coke
        case 5: menu = .cider
        case 6: menu = .fanta
        case 7: menu = .top
        case 8: menu = .cantata
        case 9: menu = .georgia
        default: break
        }
        return menu
    }

    static func mappingMenu(with sender: UILabel) -> VendingMachine.Menu {
        var menu: VendingMachine.Menu = .strawberryMilk
        switch sender.tag {
        case 1: menu = .strawberryMilk
        case 2: menu = .bananaMilk
        case 3: menu = .chocoMilk
        case 4: menu = .coke
        case 5: menu = .cider
        case 6: menu = .fanta
        case 7: menu = .top
        case 8: menu = .cantata
        case 9: menu = .georgia
        default: break
        }
        return menu
    }
}
