//
//  ExtensionBeverage.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 19..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

extension Beverage {
    
    func productType() -> String {
        return "\(type(of: self))"
    }
}
