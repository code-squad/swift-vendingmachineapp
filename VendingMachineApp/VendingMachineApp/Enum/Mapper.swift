//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Mapper {
    
    static let map: [Int: Beverage.Type] = [1: MandarineMilk.self,
                                            2: LactoseFreeMilk.self,
                                            3: StarbucksDoubleShot.self,
                                            4: TOPTheBlack.self,
                                            5: CocaCola.self,
                                            6: CocaColaZero.self,]
    
    static func key(for value: Beverage) -> Int {
        return map.first{ $0.value == type(of:value) }?.key ?? 0
    }
}
