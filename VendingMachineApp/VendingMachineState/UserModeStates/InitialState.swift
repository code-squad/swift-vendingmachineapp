//
//  InitialState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class InitialState: StateTransitionable {
    var vendingMachine: VendingMachine
    
    init(machine: VendingMachine){
        vendingMachine = machine
    }
    
    func moveToNextState(nextTo: StateTransitionable) {
        vendingMachine.changeState(nextTo, from: StateType.initialize)
    }
    
    func implementStateInstruction() -> InstructionResult {
        moveToNextState(nextTo: vendingMachine.possibleStateSet.selectState(type: .ready))
        return InstructionResult(nil, nil)
    }
}
