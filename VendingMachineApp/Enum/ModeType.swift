//
//  ModeType.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum ModeType {
    case userMode
    case adminMode
    case invalidMode
    init(value: Int){
        switch value{
        case 1:
            self = .adminMode
        case 2:
            self = .userMode
        default:
            self = .invalidMode
        }
    }
    var description:String{
        switch self {
        case .adminMode:
            return "1. 관리자모드"
        case .userMode:
            return "2. 사용자모드"
        default:
            return ""
        }
    }
}
