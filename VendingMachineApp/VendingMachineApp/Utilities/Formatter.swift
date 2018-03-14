//
//  Formatter.swift
//  VendingMachineApp
//
//  Created by yuaming on 14/03/2018.
//  Copyright © 2018 CodeSquad. All rights reserved.
//

import Foundation

enum Formatter {
    case ea(Int)
    case won(Int)
    
    var unit: String {
        switch self {
        case .ea(let number): return "\(String(format: "%3D개", number))"
        case .won(let number): return "\(String(format: "%7D원", number))"
        }
    }
}
