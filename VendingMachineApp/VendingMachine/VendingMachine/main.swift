//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var vendingMachine = VendingMachine()
vendingMachine.inventory()

struct main {
    static func operate() throws {
        while true {
            let userInput = try input()
            try handleOrder(choice: userInput)
        }
    }
    
    static func input() throws -> userChoice {
        OutputView.currentStatus(vendingMachine.balance()) // 현재 투입한 금액이 0원입니다. 다음과 같은 음료가 있습니다.
        OutputView.beverageList(vendingMachine)
        OutputView.menu() // 1. 금액추가 2. 음료구매
        let select = InputView().selectMenu() // 메뉴를 선택하도록 입력 받는다.
        return try incorrect(select)
    }
    
    static func handleOrder(choice: userChoice) throws {
        let menu = choice.menu
        let value = choice.value - 1
        let product = vendingMachine.currentBeverageStatus()
        
        switch menu {
            case .insertMoney :
                vendingMachine.insert(money: value + 1)
            case .buyBeverage :
                try checkAvailability(of: vendingMachine, value)
                vendingMachine.sell(beverageNumber: value)
                OutputView.printPurchase(productName: product[value].beverageName, price: product[value].beveragaPrice)
        }
    }
}

func work()  {
    while true {
        do {
            try main.operate()
        } catch let error as InputError{
            OutputView.printError(error)
        }
        catch {
            OutputView.printError(InputError.unexpected)
        }
    }
}
 work()
