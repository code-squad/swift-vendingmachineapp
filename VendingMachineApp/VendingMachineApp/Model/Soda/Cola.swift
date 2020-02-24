//
//  Cola.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Cola: Soda {
    static func pepsiDietCoke() -> Cola {
        return Cola(brand: "펩시", amount: 350, price: 2000, name: "다이어트콜라")
    }
}
