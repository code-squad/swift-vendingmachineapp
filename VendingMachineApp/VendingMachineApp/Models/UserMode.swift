//
//  UserMode.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/20.
//

import Foundation

protocol UserMode {
    func purchase(for drink: Drink.Type)
}
