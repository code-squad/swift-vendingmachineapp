////
////  AdminReadyState.swift
////  VendingMachine
////
////  Created by hw on 15/07/2019.
////  Copyright © 2019 JK. All rights reserved.
////
//
//import Foundation
//
//class AdminReadyState: StateTransitionable{
//    private var instruction: Int!
//    private var quantity: Int!
//    private var number: Int!
//
//    
//    var vendingMachine: VendingMachine
//    init(machine: VendingMachine){
//        vendingMachine = machine
//    }
//    
//    func moveToNextState(nextTo: StateTransitionable) {
//        vendingMachine.changeState(nextTo, from: .adminReady)
//    }
//    
//    func implementStateInstruction() -> InstructionResult{
//        let printableMessage: String = displayVendingMachineInfo()
//        let stateType = AdminStateType.init(value: instruction)
//        switch stateType {
//        case .addStock:
//            shiftAddStockStateWithDrinkNumber(number: number, quantity: quantity, type: .addStock)
//        case .removeStock:
//            shiftRemoveStockStateWithDrinkNumber(number: number, quantity: quantity, type: .removeStock)
//        case .modeSelect:
//            shiftModeSelectState(.modeSelect)
//        default:
//            break
//        }
//        return InstructionResult(printableMessage, nil)
//    }
//    
//    private func shiftModeSelectState(_ stateType: StateType){
//        moveToNextState(nextTo: vendingMachine.possibleStateSet.selectState(type: stateType))
//    }
//    
//    func receiveInstruction(instruction: Int) {
//        self.instruction = instruction
//    }
//    
//    func receiveDrinkStcokInstruction(number: Int, quantity: Int) {
//        self.number = number
//        self.quantity = quantity
//    }
//    
//    private func displayVendingMachineInfo() -> String{
//        let message = "\(StateType.addStock.description)\n\(StateType.modeSelect.description)"
//        return message
//    }
//    
//    private func shiftRemoveStockStateWithDrinkNumber(number: Int, quantity: Int, type: StateType){
//        let selectState = vendingMachine.possibleStateSet.selectState(type: type)
//        moveToNextState(nextTo: selectState)
//        guard let nextState = selectState as? RemoveStockState else {
//            return
//        }
//        nextState.receiveDrinkNumberQuantity(num: number, quantity: quantity)
//    }
//    
//    private func shiftAddStockStateWithDrinkNumber(number: Int, quantity: Int, type: StateType){
//        let selectState = vendingMachine.possibleStateSet.selectState(type: type)
//        moveToNextState(nextTo: selectState)
//        guard let nextState = selectState as? AddStockState else {
//            return
//        }
//        nextState.receiveDrinkNumberQuantity(num: number, quantity: quantity)
//    }
//}
