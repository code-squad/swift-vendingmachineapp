//
//  DrinkDelegate.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

protocol Drinkable {
    func validate(with date: Date) -> Bool
}
