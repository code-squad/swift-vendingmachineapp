//
//  Cola.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Cola: Soda {
    func isZeroCola() -> Bool {
        return calorie == 0
    }
}
