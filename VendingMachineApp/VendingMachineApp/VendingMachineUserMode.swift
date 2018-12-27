//
//  VendingMachineUserMode.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 27..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachineUserMode {
    static func run(_ vendingMachineOfUserMode: VendingMachineUserFunction) -> VendingMachine? {
        var vendingMachine = vendingMachineOfUserMode
        while true {
            let buyableList = vendingMachine.buyableProductList()
            let inputMent = MentMaker.makeUserInputMent(vendingMachineInfo: vendingMachine)
            let inputString = InputView.readInput(ment: inputMent)
            if VendingMachineMode.back.isEqual(input: inputString) {
                guard let vendingMachine = vendingMachine as? VendingMachine else {return nil}
                return vendingMachine
            }
            guard ValidChecker.checkUserInput(string: inputString, count: buyableList.count) else {return nil}
            let input = VendingMachineInput(input: inputString)

            if input.isModeEqual(1) {
                guard let money = input.readMoney() else {return nil}
                vendingMachine.insert(money: money)
            }

            if input.isModeEqual(2) {
                let productKeys = Array(buyableList.keys)
                guard let productKey = input.readKey(keys: productKeys) else {return nil}
                guard let boughtProduct = vendingMachine.buy(productName: productKey) else {return nil}
                let postPurchaseMent = MentMaker.makePostPurchaseMent(beverage: boughtProduct)
                OutputView.show(result: postPurchaseMent)
            }
            print("")
        }
    }
}
