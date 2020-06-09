//
//  BeverageTagControl.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/06/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

protocol BeverageTagControl {
    var beverageItemByTag: BeverageItemByTag? {get set}

    func beverage() -> Beverage?
}

extension BeverageTagControl {
    func beverage() -> Beverage? {
        return beverageItemByTag?.beverage()
    }
}
