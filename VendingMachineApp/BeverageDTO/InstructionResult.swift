//
//  InstructionResult.swift
//  VendingMachineApp
//
//  Created by hw on 30/07/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

struct InstructionResult {
    var success: String?
    var failure: VendingMachineError?
    
    init(_ success: String?, _ failure: VendingMachineError?){
        self.success = success
        self.failure = failure
    }
}
