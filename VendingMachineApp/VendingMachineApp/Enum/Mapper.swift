//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Mapper {
    
    static let map: [Int: BeverageProduct.Type] = [1: MandarineMilk.self,
                                                   2: LactoseFreeMilk.self,
                                                   3: StarbucksDoubleShot.self,
                                                   4: TOPTheBlack.self,
                                                   5: CocaCola.self,
                                                   6: CocaColaZero.self,]
}
