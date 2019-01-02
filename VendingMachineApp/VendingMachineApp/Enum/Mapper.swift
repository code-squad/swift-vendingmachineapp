//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

enum Mapper: Int, CaseIterable {
    case mandarineMilk = 1
    case lactoseFreeMilk = 2
    case starbucksDoubleShot = 3
    case topTheBlack = 4
    case cocaCola = 5
    case cocaColaZero = 6
    
    func beverageName() -> String {
        switch self {
        case .mandarineMilk:
            return "귤맛우유"
        case .lactoseFreeMilk:
            return "소화가잘되는우유"
        case .starbucksDoubleShot:
            return "스타벅스더블샷에스프레소&크림"
        case .topTheBlack:
            return "맥심티오피더블랙"
        case .cocaCola:
            return "코카콜라"
        case .cocaColaZero:
            return "코카콜라제로"
        }
    }
}
