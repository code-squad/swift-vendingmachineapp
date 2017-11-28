//
//  Cider.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Cider: SoftDrink {
    func isZeroCider() -> Bool {
        return calorie < 4
    }

}
