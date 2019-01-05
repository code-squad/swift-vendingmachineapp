//
//  BuyableProduct.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 18. 12. 31..
//  Copyright © 2018 hngfu. All rights reserved.
//

import Foundation

protocol Product {
    init()
}

extension Product {
    static func typeString() -> String {
        return "\(self)"
    }
}
