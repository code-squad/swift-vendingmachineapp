//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Mapper {
    static private let map: [String: Int] = [MandarineMilk.typeString(): 1,
                                             LactoseFreeMilk.typeString(): 2,
                                             StarbucksDoubleShot.typeString(): 3,
                                             TOPTheBlack.typeString(): 4,
                                             CocaCola.typeString(): 5,
                                             CocaColaZero.typeString(): 6]
    
    static func mapping(productName: String) -> Int {
        return map[productName] ?? 0
    }
}
