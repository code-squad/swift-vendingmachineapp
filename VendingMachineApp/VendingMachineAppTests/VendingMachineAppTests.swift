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
       vendingMachine.raiseMoney(fiveThousandCount: 2, thousandCount: 2, fiveHundredCount: 1, hundredCount: 2)
        let leftMoney = vendingMachine.confirmBalance()
        XCTAssertEqual(leftMoney.balance, 12700)
    }
    
    func testAvailableBeverageNowMoney() {
         vendingMachine.raiseMoney(fiveThousandCount: 2, thousandCount: 2, fiveHundredCount: 1, hundredCount: 2)
        let availableBeverage = vendingMachine.reportAvailableBeverageNowMoney()
        XCTAssertEqual(availableBeverage.contains(vendingMachine.bananaMilk), true)
        XCTAssertEqual(availableBeverage.contains(vendingMachine.americano), true)
        XCTAssertEqual(availableBeverage.contains(vendingMachine.coke), true)
    }

    func testPurchaseBeverage() {
        vendingMachine.raiseMoney(fiveThousandCount: 2, thousandCount: 2, fiveHundredCount: 1, hundredCount: 2)
        vendingMachine.purchaseBeverage(index: 0)
        XCTAssertEqual(vendingMachine.balance.balance, 11500)
    }
    
    func testPurchaseHistory() {
        vendingMachine.purchaseBeverage(index: 0)
        let history = vendingMachine.reportPurchasedHistory()
        XCTAssertEqual(history.contains(vendingMachine.bananaMilk), true)
        XCTAssertEqual(history.contains(vendingMachine.americano), false)
        XCTAssertEqual(history.contains(vendingMachine.coke), false)
    }
    
}
