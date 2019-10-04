//
//  Mode.swift
//  VendingMachine
//
//  Created by CHOMINJI on 05/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Mode: Int, CaseIterable, CustomStringConvertible {
    case manager = 1
    case user = 2
    
    var description: String {
        switch self {
        case .manager:
            return "\(rawValue). 관리자 모드"
        case .user:
            return "\(rawValue). 사용자 모드"
        }
    }
}
