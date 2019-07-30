//
//  FarmCode.swift
//  VendingMachine
//
//  Created by hw on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum FarmCode : Int, Codable {
    case none = -1
    case kyunggy = 1000
    case south_chungChung = 2000
    case north_chungChung = 2500
    case south_jeonLa = 3000
    case north_jeonLa = 3500
    case south_kyungSang = 4000
    case north_kyungSan = 4500
    case kangwon = 5000
    case jeju = 6000
    case imported = 7000
    
    init(from decoder: Decoder) throws {
        let code = try decoder.singleValueContainer().decode(Int.self)
        self = FarmCode(rawValue: code) ?? .none
    }
}
