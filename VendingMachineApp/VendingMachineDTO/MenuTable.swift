//
//  MenuTable.swift
//  VendingMachine
//
//  Created by hw on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class MenuTable: Codable{
    private (set) var menu: [String : Int]
    init(drinkStockTable: DrinkStockTable ){
        menu = [String: Int]()
        for element in drinkStockTable.stockTable{
            menu.updateValue(element.key, forKey: "\(element.value.drinkName)")
        }
    }
    
    
    func updateMenuTable(nextIndex newMenuNumber: Int, name newDrinkName : String) {
        menu.updateValue(newMenuNumber, forKey: newDrinkName)
    }
    
}
