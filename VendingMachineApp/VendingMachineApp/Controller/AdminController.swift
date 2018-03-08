//
//  AdminController.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class AdminController {

    static func mode(vendingMachine: VendingMachine) {
        let adminInputView = AdminInputView()
        let adminOutputView = AdminOutputView()
        var isAdminModeContinue = true
        repeat {
            // 전체 재고 출력
            let entireInventory = vendingMachine.showEntireInventory()
            adminOutputView.printBeverageMenu(entireInventory: entireInventory)
            adminOutputView.printInventoryUseMenu()
            // 메뉴 입력

            let inputValue = adminInputView.getMenuInput()
            let choiceBeverage = vendingMachine.choiceBeverageData(number: inputValue.menuNumber)

            // 메뉴 입력에 따른 분류
            switch inputValue.modeOfAdmin {
            case 1:
                vendingMachine.addInInventory(beverageName: choiceBeverage, number: inputValue.numberOfTheBeverage)
                adminOutputView.printAddInventory(choiceBeverage: choiceBeverage,
                                                  number: inputValue.numberOfTheBeverage)
            case 2:
                vendingMachine.deleteInventory(beverageName: choiceBeverage, number: inputValue.numberOfTheBeverage)
                adminOutputView.printDeleteInventory(choiceBeverage: choiceBeverage,
                                                     number: inputValue.numberOfTheBeverage)
            case 0 :
                isAdminModeContinue = false
            default: break
            }
        } while isAdminModeContinue
    }
}
