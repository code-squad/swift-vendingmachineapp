//
//  UnitTestVendingMachine.swift
//  UnitTestVendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import XCTest

class UnitTestVendingMachine: XCTestCase {
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        vendingMachine = VendingMachine()
        vendingMachine.inventory()
    }
    
    /// 동작
    // 돈 넣기
    func testIncreaseBalance() {
        vendingMachine.insert(money: 1000)
        XCTAssertEqual(vendingMachine.balance(),1000)
    }
    
    // 돈 더 넣기
    func testAddBalance() {
        vendingMachine.insert(money: 1000)
        vendingMachine.insert(money: 1000)
        XCTAssertEqual(vendingMachine.balance(),2000)
    }
    
    // 음료 하나 구매 후 재고 하나 줄이기
    func testDecreaseBeverageCount() {
        vendingMachine.insert(money: 1000)
        vendingMachine.sell(beverageNumber: 2)
        let drink = vendingMachine.currentBeverageStatus()
        XCTAssertEqual(drink[2].beverageCount,9)
    }
    
    // 돈 넣고 음료 구매 후 잔액 차감하기
    func testDecreaseBalacne() {
        vendingMachine.insert(money: 2000)
        vendingMachine.sell(beverageNumber: 2)
        XCTAssertEqual(vendingMachine.balance(),0)
    }
    
    /// 에러
    // 메뉴 입력 확인
    func testIncorrectError() {
        do {
            let _ = try incorrect("3 1000")
        } catch let error {
            XCTFail("\(error as! InputError)")
        }
    }
    
    // 현재 잔액으로 음료 구매
    func testEnoughBalance() {
        vendingMachine.insert(money: 10000)
        do {
            let _ = try CheckAvailability(of: vendingMachine, 2)
        } catch let error {
            XCTFail("\(error as! InputError)")
        }
    }
    
    func testNotEnoughBalanceError() {
        vendingMachine.insert(money: 100)
        do {
            let _ = try CheckAvailability(of: vendingMachine, 2)
        } catch let error {
            XCTFail("\(error as! InputError)")
        }
    }
    
    // 음료의 재고 확인
    func testCanBuy() {
        vendingMachine.insert(money: 2000)
        do {
            let _ = try CheckAvailability(of: vendingMachine, 2)
        } catch let error {
            XCTFail("\(error as! InputError)")
        }
    }
    
    func testCannotBuy() {
        vendingMachine.insert(money: 10000)
        for _ in 0 ... 9 {
            vendingMachine.sell(beverageNumber: 2)
        }
        do {
            let _ = try CheckAvailability(of: vendingMachine, 2)
        } catch let error {
            XCTFail("\(error as! InputError)")
        }
    }
}
