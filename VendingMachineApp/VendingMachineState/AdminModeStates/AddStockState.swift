//
//  AddStockState.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AddStockState: StateTransitionable, StockManipulatable{
    private var quantity: Int!
    private var number: Int!
    var vendingMachine: VendingMachine

    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: .addStock)
    }
    
    func implementStateInstruction() -> InstructionResult {
        do {
            let drink = try vendingMachine.selectProduct(productId: number)
            drink.updateDateInfo(days: 90)
            try vendingMachine.addDrinkStock(drink, quantity: quantity)
            moveToNextState(nextTo: vendingMachine.possibleStateSet.selectState(type: .adminReady))
            guard let quantity = quantity else {
                return InstructionResult(nil, .invalidDrinkQuantity)
            }
            let addStockResult = AuxiliaryStockStateModifying.displayModifiedInfo(drink, quantity: quantity)
            return addStockResult
        }catch let error as VendingMachineError{
            return InstructionResult(nil, error)
        }catch{
            return InstructionResult(nil, .unknownError)
        }
    }
    
    func receiveDrinkNumberQuantity(num: Int, quantity: Int) {
        self.number = num
        self.quantity = quantity
    }
}
