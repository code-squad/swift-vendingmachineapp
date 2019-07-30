////
////  ModeSelectState.swift
////  VendingMachine
////
////  Created by hw on 15/07/2019.
////  Copyright © 2019 JK. All rights reserved.
////
//
//import Foundation
//
//class ModeSelectState: StateTransitionable{
//    var vendingMachine: VendingMachine
//    var instruction: Int!
//
//    init(machine: VendingMachine){
//        self.vendingMachine = machine
//    }
//
//    func moveToNextState(nextTo: StateTransitionable) {
//        vendingMachine.changeState(nextTo, from: StateType.modeSelect)
//    }
//
//    func recieveInstruction(_ instruction: Int) {
//        self.instruction = instruction
//    }
//
//    func implementStateInstruction() -> InstructionResult {
//        let message = displayVendingMachineModeInfo()
//        let modeType = ModeType.init(value: self.instruction)
//        switch modeType {
//        case .adminMode:
//            shiftAdminModeState()
//        case .userMode:
//            shiftUserModeState()
//        default:
//            break
//        }
//        return InstructionResult(message, nil)
//    }
//
//    private func shiftUserModeState(){
//        moveToNextState(nextTo: self.vendingMachine.possibleStateSet.initialState)
//    }
//
//    private func shiftAdminModeState(){
//        moveToNextState(nextTo: self.vendingMachine.possibleStateSet.adminInitialState)
//    }
//
//    private func displayVendingMachineModeInfo() -> String{
//        let message = "\(ModeType.adminMode.description)\n\(ModeType.userMode.description)"
//        return message
//    }
//
//}
