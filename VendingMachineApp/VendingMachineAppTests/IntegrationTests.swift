//
//  IntegrationTests.swift
//  VendingMachineAppTests
//
//  Created by Chaewan Park on 2020/03/05.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class IntegrationTests: XCTestCase {
    
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        vendingMachine = VendingMachine()
    }
    
    func testVendingMachine() {
        vendingMachine.insert(money: 1000)
        XCTAssertEqual(vendingMachine.balance, 1000)
        vendingMachine.insert(money: 5000)
        XCTAssertEqual(vendingMachine.balance, 6000)
        
        let items = [StrawberryMilk(), StrawberryMilk(), Coke(), Fanta(), Top(), Top()]
        items.forEach { vendingMachine.fill(beverage: $0) }
        
        vendingMachine.sell(beverage: "StrawberryMilk")
        XCTAssertEqual(vendingMachine.balance, 4500)
        vendingMachine.sell(beverage: "Top")
        XCTAssertEqual(vendingMachine.balance, 3300)
        
        var salesLog = [Beverage]()
        vendingMachine.repeatForSalesLog { salesLog.append($0) }
        XCTAssert(salesLog[0] === items[0])
        XCTAssert(salesLog[1] === items[4])
    }
}
