//
//  Beans.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

enum Beans : String, CustomStringConvertible{
    var description: String {
        return self.rawValue
    }
    
    case arabica = "Arabica"
    case robusta = "Robusta"
}
