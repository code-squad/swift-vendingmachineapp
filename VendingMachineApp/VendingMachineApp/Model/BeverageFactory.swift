//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

struct BeverageFactory {
    static func makeBeverage(beverageType: Beverage.Type) -> Beverage {
        return beverageType.init()
    }
}
