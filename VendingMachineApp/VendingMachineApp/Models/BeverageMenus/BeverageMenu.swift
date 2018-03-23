//
//  BeverageMenu.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum BeverageMenu: Int, Codable {
    case bananaMilk
    case strawberryMilk
    case cocaCola
    case pepsi
    case georgia
    case top
}

extension BeverageMenu {
    static var allValues: [BeverageMenu] {
        return [.bananaMilk, .cocaCola, .georgia, .pepsi, .strawberryMilk, .top]
    }
    
    static func getBeverageMenu(index: Int) -> BeverageMenu {
        guard let beverageMenu = BeverageMenu(rawValue: index) else {
            return BeverageMenu.bananaMilk
        }
        
        return beverageMenu
    }
}
