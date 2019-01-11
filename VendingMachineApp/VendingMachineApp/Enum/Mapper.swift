//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Mapper {
    static private let map: [ObjectIdentifier: Int] = [ObjectIdentifier(MandarineMilk.self): 1,
                                               ObjectIdentifier(LactoseFreeMilk.self): 2,
                                               ObjectIdentifier(StarbucksDoubleShot.self): 3,
                                               ObjectIdentifier(TOPTheBlack.self): 4,
                                               ObjectIdentifier(CocaCola.self): 5,
                                               ObjectIdentifier(CocaColaZero.self): 6]
    
    static func mapping(product: Beverage) -> Int {
        return map[ObjectIdentifier(type(of: product))] ?? 0
    }
}
