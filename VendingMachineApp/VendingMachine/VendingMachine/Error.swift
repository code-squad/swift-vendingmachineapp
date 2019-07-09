//
//  Error.swift
//  VendingMachine
//
//  Created by 김지나 on 15/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum InputError: String, Error {
    case incorrect = "❌ 메뉴를 확인해주세요"
    case notEnoughBalance = "❌ 잔액이 부족합니다."
    case outOfStock = "❌ 재고가 부족합니다."
    case unexpected = "❗️예상치 못한 에러가 발생했습니다."
    
    func message() -> String {
        return self.rawValue
    }
}

typealias userChoice = (menu: VendingMachine.Menu, value: Int)

// 첫 입력 확인
func incorrect(_ input: String) throws -> userChoice {
    let UserInput = input.split(separator: " ").map { String($0) }
    guard let menuNum = UserInput.first, let menu = VendingMachine.Menu(rawValue: menuNum) else { throw InputError.incorrect }
    guard let inputNum = UserInput.last, let value = Int(inputNum) else { throw InputError.incorrect }
    if Int(menuNum)! > 2 { throw InputError.incorrect }
    return (menu, value)
}

// 두 번째 입력 확인
func checkAvailability(of machine: VendingMachine, _ select: Int) throws {
    let balance = machine.balance()
//    let status = machine.currentBeverageStatus()
    
    // 올바른 음료를 선택했는지 확인
//    if select >= status.count { throw InputError.incorrect }
//    // 현재의 잔액으로 선택한 음료의 구매 가능 여부 확인
//    if status[select].beveragaPrice > balance { throw InputError.notEnoughBalance }
//    // 선택한 음료의 구매 가능한 재고의 존재 여부
//    if status[select].beverageCount == 0 { throw InputError.outOfStock }
}
