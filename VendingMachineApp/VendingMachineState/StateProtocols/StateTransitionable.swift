//
//  VendingMachineState.swift
//  VendingMachine
//
//  Created by hw on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

//typealias InstructionResult = (success: String?, failure: VendingMachineError?)
struct InstructionResult {
    var success: String?
    var failure: VendingMachineError?
    
    init(_ success: String?, _ failure: VendingMachineError?){
        self.success = success
        self.failure = failure
    }
}
protocol StateTransitionable {
    func moveToNextState(nextTo: StateTransitionable)
    func implementStateInstruction() -> InstructionResult
}
