//
//  AdminInitialState.swift
//  VendingMachine
//
//  Created by hw on 15/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AdminInitialState: StateTransitionable{
    var vendingMachine: VendingMachine
    
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: StateType.adminInitialize)
    }

    func implementStateInstruction() -> InstructionResult {
        moveToNextState(nextTo: vendingMachine.possibleStateSet.selectState(type: .adminReady))
        return InstructionResult(nil, nil)
    }
}
