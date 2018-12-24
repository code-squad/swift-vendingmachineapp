//
//  BeverageGroup.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BeverageGroup: Beverage {

    var group: BeverageCategory {
        return .etc
    }

    func isInEqualGroup(with beverage: BeverageGroup) -> Bool {
        return self.group == beverage.group
    }

}
