//
//  VendingMachineTests.swift
//  VendingMachineAppTests
//
//  Created by Chaewan Park on 2020/03/05.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTests: XCTestCase {
    
    var vendingMachine: VendingMachine!
    var mockCashier: MockCashier!
    
    override func setUp() {
        mockCashier = MockCashier()
        vendingMachine = VendingMachine(cashier: mockCashier)
    }
    
    func testInsert() {
        vendingMachine.insert(money: 1000)
        XCTAssertEqual(mockCashier.cash, 1000)
        XCTAssertEqual(mockCashier.addToBalanceCalled, 1)
    }
    
    func testSell() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { vendingMachine.fill(beverage: $0) }
        
        vendingMachine.insert(money: 2000)
        vendingMachine.sell(beverage: "Coke")
        
        XCTAssertEqual(mockCashier.cash, 400)
        XCTAssertEqual(mockCashier.balanceCalled, 1)
        XCTAssertEqual(mockCashier.addToBalanceCalled, 1)
        XCTAssertEqual(mockCashier.sellCalled, 1)
    }
    
    func testSalesLog() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { vendingMachine.fill(beverage: $0) }
        
        vendingMachine.insert(money: 2000)
        vendingMachine.sell(beverage: "Coke")
        
        vendingMachine.repeatForSalesLog { _ in return }
        XCTAssertEqual(mockCashier.salesLogCalled, 1)
    }
}

class MockCashier: Calculable {
    var cash = 0
    var balanceCalled = 0
    var addToBalanceCalled = 0
    var sellCalled = 0
    var salesLogCalled = 0
    
    func balance() -> Int {
        balanceCalled += 1
        return cash
    }
    
    func addToBalance(_ money: Int) {
        addToBalanceCalled += 1
        cash += money
    }
    
    func sell(beverage: Beverage) {
        sellCalled += 1
        cash -= beverage.price
    }
    
    func forEachSalesLog(_ block: (Beverage) -> Void) {
        salesLogCalled += 1
    }
}
