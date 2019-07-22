//
//  VendingMachineState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias InstructionResult = (success: String?, failure: VendingMachineError?)

protocol StateTransitionable {
    func moveToNextState(nextTo: StateTransitionable)
    func implementStateInstruction() -> InstructionResult
}
