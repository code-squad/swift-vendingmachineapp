//
//  CashierTests.swift
//  VendingMachineAppTests
//
//  Created by Chaewan Park on 2020/03/07.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class CashierTests: XCTestCase {
    
    var cashier: Cashier!
    
    override func setUp() {
        cashier = Cashier()
    }
    
    func testAddToBalance() {
        cashier.addToBalance(1000)
        XCTAssertEqual(cashier.balance(), 1000)
    }
    
    func testSell() {
        let beverage = ChocolateMilk(price: 1500)
        cashier.addToBalance(5000)
        cashier.sell(beverage: beverage)
        
        var log = [Beverage]()
        XCTAssertEqual(cashier.balance(), 3500)
        cashier.forEachSalesLog { log.append($0) }
        XCTAssertEqual(log, [ChocolateMilk(price: 1500)])
    }
}
