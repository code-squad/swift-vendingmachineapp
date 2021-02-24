//
//  Drinkable.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

protocol Drinkable {
    func isExpired(by date: Date) -> Bool
}
