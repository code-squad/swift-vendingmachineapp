//
//  PurchaseHistory.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/26.
//

import Foundation

class PurchaseHistory {
    private(set) var purchasedDrinks: [Drink] = []
    
    func add(drink: Drink) {
        purchasedDrinks.append(drink)
    }
}
