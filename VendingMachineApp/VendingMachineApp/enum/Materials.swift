//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

enum Materials : String, CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
    case steel = "금속"
    case paper = "종이"
    case plastic = "플라스틱"
}
