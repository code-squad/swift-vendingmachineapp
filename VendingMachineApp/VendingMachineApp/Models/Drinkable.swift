//
//  DrinkDelegate.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

protocol Drinkable {
    func validateManufacturedAt(with date: Date) -> Bool
    func isHot(with temperature: Int) -> Bool
}
