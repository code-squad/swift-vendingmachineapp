//
//  CoffeeType.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum CoffeeType{
    case americano
    case latte
    case caramel
    case coldbrew
    
    var description: String {
        switch self{
        case .americano:
            return "아메리카노"
        case .latte:
            return "라떼"
        case .caramel:
            return "카라멜마키아또"
        case .coldbrew:
            return "콜드브루"
        }
    }
}
