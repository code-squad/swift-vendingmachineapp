//
//  Top.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class Top: Coffee {
    static func americano() -> Top {
        return Top(brand: "맥심", amount: 400, price: 3000, name: "TOP아메리카노")
    }
}
