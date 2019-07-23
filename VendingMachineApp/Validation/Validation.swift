//
//  Validation.swift
//  VendingMachine
//
//  Created by hw on 11/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Validation{
    
    static func isValidInputPair(_ nums: [Int]) -> Bool {
        var result = nums.count == 2 ? true : false
        result = isValidNumber(nums[0]) ? true : false
        result = isValidNumber(nums[1]) ? true : false
        return result
    }
    static func isValidNumber(_ num: Int) -> Bool {
        return num > 0 ? true : false
    }
    static func convertStringToNumber(_ num: String) throws -> Int {
        guard let number = Int(num) else{
            throw VendingMachineError.inputTypeCastingError
        }
        return number
    }
}
