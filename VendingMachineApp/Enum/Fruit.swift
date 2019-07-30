//
//  Fruit.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Fruit: String, CustomStringConvertible, Codable{
    case strawberry
    case purpleGrape
    case orange
    case whiteGrape
    case mango
    
    init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        self = Fruit(rawValue: label) ?? .strawberry
    }
    
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
