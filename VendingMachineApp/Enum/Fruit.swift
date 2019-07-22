//
//  Fruit.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Fruit: CustomStringConvertible{
    case strawberry
    case purpleGrape
    case orange
    case whiteGrape
    case mango
    
    var description: String {
        switch self{
        case .strawberry:
            return "딸기"
        case .purpleGrape:
            return "포도"
        case .orange:
            return "오렌지"
        case .whiteGrape:
            return "청포도"
        case .mango :
            return "망고"
        }
    }
}
