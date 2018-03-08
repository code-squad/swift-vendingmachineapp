//
//  UserController.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class UserController {
    
    static func mode(takeVendingMachine: VendingMachine) {
        var isFirst = true
        var isUserModeContinue = true
        let userInputView = UserInputView()
        let userOutputView = UserOutputView()
        var vendingMachine = takeVendingMachine

        var availableBeverage = [ObjectIdentifier: [Beverage]]()
        repeat {
            // 현재 금액
            userOutputView.printCurrentCoins(coins: vendingMachine.coins)
            if isFirst {
                
                // 초기 메뉴
                let entireInventory = vendingMachine.showEntireInventory()
                userOutputView.printBeverageMenu(entireInventory: entireInventory)
                isFirst = false
            } else {
                
                // 이후 기본 메뉴
                availableBeverage = vendingMachine.listOfDrinksAvailable()
                userOutputView.printAddAmoutMenu(entireInventory: availableBeverage)
            }
            
            // 메뉴 선택 및 이동
            userOutputView.printDoingMenu()
            let inputValue = userInputView.getMenuInput()
            switch inputValue.modeOfUsers {
            case 1:
                if let addCoinMode = inputValue as? CoinBox {
                    vendingMachine.putCoins(coins: addCoinMode.amount)
                }
            case 2:
                if let beveragePurchaseMode = inputValue as? BeveragePurchase {
                    let choiceBeverageKey = userOutputView.menuOfPurchaseBeverage(
                        menuNumber: beveragePurchaseMode.beverageMenu, entireInventory: availableBeverage)
                    vendingMachine.buyBeverage(beverageKey: choiceBeverageKey)
                }
            case 0:
                isUserModeContinue = false
            default: break
            }
        } while isUserModeContinue
    }
}
