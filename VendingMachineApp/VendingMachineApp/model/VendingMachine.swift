//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 임승혁 on 2020/03/12.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

class VendingMachine {
    private(set) var drinkStock = [Drink]()
    
    func addDrinkStock(drink: Drink) {
        drinkStock.append(drink)
    }
}
