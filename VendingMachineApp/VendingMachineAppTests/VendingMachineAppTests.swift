//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by delma on 05/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    var vendingMachine = VendingMachine()
    
    override func setUp() {
        vendingMachine.addStock(0)
        vendingMachine.addStock(3)
        vendingMachine.addStock(6)
    }
    
    func testRaiseMoney() {
        vendingMachine.raiseMoney(index: 0)
        let leftMoney = vendingMachine.confirmBalance()
        XCTAssertEqual(leftMoney.balance, 5000)
    }
    
    func testAvailableBeverageNowMoney() {
         vendingMachine.raiseMoney(index: 0)
        let availableBeverage = vendingMachine.reportAvailableBeverageNowMoney()
        XCTAssertEqual(availableBeverage.contains(vendingMachine.bananaMilk), true)
        XCTAssertEqual(availableBeverage.contains(vendingMachine.americano), true)
        XCTAssertEqual(availableBeverage.contains(vendingMachine.coke), true)
    }

    func testPurchaseBeverage() {
        vendingMachine.raiseMoney(index: 0)
        vendingMachine.purchaseBeverage(index: 0)
        XCTAssertEqual(vendingMachine.balance.balance, 3800)
    }
    
    func testPurchaseHistory() {
        vendingMachine.purchaseBeverage(index: 0)
        let history = vendingMachine.reportPurchasedHistory()
        XCTAssertEqual(history.contains(vendingMachine.bananaMilk), true)
        XCTAssertEqual(history.contains(vendingMachine.americano), false)
        XCTAssertEqual(history.contains(vendingMachine.coke), false)
    }
    
}
