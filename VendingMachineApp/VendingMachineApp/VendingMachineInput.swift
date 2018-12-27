//
//  Input.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 24..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachineInput {
    private let mode: Int
    private let value: Int?

    init(input: String) {
        let splitedInput = input.split(separator: " ").map {Int($0) ?? 0}
        self.mode = splitedInput[0]
        self.value = splitedInput.count >= 2 ? splitedInput[1] : nil
    }

    func isModeEqual(_ int: Int) -> Bool {
        return int == self.mode
    }

    func readMoney() -> Int? {
        return self.value
    }

    func readKey(keys: [String]) -> String? {
        guard let value = self.value else {return nil}
        if value >= 1 {
            return keys[value - 1]
        }
        return nil
    }

    func readBeverage(addableList: [AddableBeverage]) -> AddableBeverage? {
        guard let value = self.value else {return nil}
        if value >= 1 {
            return addableList[value - 1]
        }
        return nil
    }
}
