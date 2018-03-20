//
//  Inventory.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

final class Inventory {
    private var beverageBoxes: [BeverageBox]
    
    init(_ beverageBoxes: [BeverageBox]) {
        self.beverageBoxes = beverageBoxes
    }

    func add(beverageMenu: BeverageMenu, quantity: Int = 1) -> Inventory {
        return updateBeverageBox(beverageBox: BeverageBox(beverageMenu: beverageMenu, quantity: quantity))
    }
    
    func deduct(beverageMenu: BeverageMenu, quantity: Int = 1) throws  -> Inventory {
        let beverageBox = BeverageBox(beverageMenu: beverageMenu, quantity: -quantity)
        
        guard isAvailable(beverageMenu: beverageMenu) else { throw VendingMachineErrors.outOfStock }
        if isNegative(beverageBox: beverageBox) { throw VendingMachineErrors.outOfStock }
        
        return updateBeverageBox(beverageBox: beverageBox)
    }
    
    func countBeverage(beverageMenu: BeverageMenu) -> Int {
        return self.beverageBoxes.filter({
            $0.beverageMenu == beverageMenu
        }).reduce(0, {$0 + $1.quantity})
    }
    
    func fetchListOfBeverage() -> [BeverageBox] {
        return BeverageMenu.allValues.map({ menu -> BeverageBox in
            BeverageBox(beverageMenu: menu, quantity: countBeverage(beverageMenu: menu))
        })
    }
}

extension Inventory: Codable {
    private enum CodingKeys: CodingKey {
        case beverageBoxes
    }
    
    convenience init(from decoder: Decoder) throws {
        self.init([BeverageBox]())
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.beverageBoxes = try values.decode([BeverageBox].self, forKey: .beverageBoxes)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(beverageBoxes, forKey: .beverageBoxes)
    }
}


private extension Inventory {
    func isAvailable(beverageMenu: BeverageMenu) -> Bool {
        return beverageBoxes.count > 0 && countBeverage(beverageMenu: beverageMenu) > 0
    }
    
    func updateBeverageBox(beverageBox: BeverageBox) -> Inventory {
        self.beverageBoxes.append(beverageBox)
        return Inventory(self.beverageBoxes)
    }
    
    func isNegative(beverageBox: BeverageBox) -> Bool {
        return countBeverage(beverageMenu: beverageBox.beverageMenu) + beverageBox.quantity < 0
    }
}
