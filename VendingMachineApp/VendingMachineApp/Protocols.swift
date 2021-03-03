//
//  Protocols.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol SafelyDrinkable {
    func validate(with date: Date) -> Bool
}
