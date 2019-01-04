//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Mapper {
    static private let map: [Int: String] = [1: "\(type(of:MandarineMilk()))",
        2: "\(type(of: LactoseFreeMilk()))",
        3: "\(type(of: StarbucksDoubleShot()))",
        4: "\(type(of: TOPTheBlack()))",
        5: "\(type(of: CocaCola()))",
        6: "\(type(of: CocaColaZero()))",]
    
    static func mapping(tag: Int) -> String? {
        return map[tag]
    }
}
