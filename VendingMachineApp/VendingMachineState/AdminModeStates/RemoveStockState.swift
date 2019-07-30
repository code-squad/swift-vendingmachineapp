////
////  RemoveStockState.swift
////  VendingMachine
////
////  Created by hw on 15/07/2019.
////  Copyright © 2019 JK. All rights reserved.
////
//
//import Foundation
//
//class RemoveStockState: StateTransitionable, StockManipulatable{
//    private var quantity: Int!
//    private var number: Int!
//    var vendingMachine: VendingMachine
//
//    init(machine: VendingMachine){
//        vendingMachine = machine
//    }
//
//    func moveToNextState(nextTo: StateTransitionable) {
//        vendingMachine.changeState(nextTo, from: .removeStock)
//    }
//
//    func implementStateInstruction() -> InstructionResult {
//        do {
//            let drink = try vendingMachine.selectProduct(productId: number)
//            let removeStock = try vendingMachine.removeDrinkStock(number: number, quantity: quantity)
//            quantity = removeStock.actualRemoved
//            moveToNextState(nextTo: vendingMachine.possibleStateSet.selectState(type: .adminReady))
//            guard let quantity = quantity else {
//                return InstructionResult(nil, .invalidDrinkQuantity)
//            }
//            let removeStockResult = AuxiliaryStockStateModifying.displayModifiedInfo(drink, quantity: quantity)
//            return removeStockResult
//        }catch let error as VendingMachineError{
//            return InstructionResult(nil, error)
//        }catch{
//            return InstructionResult(nil, .unknownError)
//        }
//    }
//
//    func receiveDrinkNumberQuantity(num: Int, quantity: Int) {
//        self.number = num
//        self.quantity = quantity
//    }
//}
//
