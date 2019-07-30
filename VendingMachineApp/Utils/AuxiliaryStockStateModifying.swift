//
//  AuxiliaryModifyStock.swift
//  VendingMachine
//
//  Created by hw on 17/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AuxiliaryStockStateModifying {
    init(){
    }
    static func displayModifiedInfo(_ drink: Drink, quantity: Int) -> InstructionResult{
        let drinkItemInfoFormat = { (name: String) -> InstructionResult in
            return InstructionResult("\(name), \(quantity)", nil)
        }
        let stockResult = drink.displayModifiedStock(format: drinkItemInfoFormat)
        return stockResult
    }
}
