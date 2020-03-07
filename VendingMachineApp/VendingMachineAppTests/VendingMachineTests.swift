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
    
    override func setUp() {
        vendingMachine = VendingMachine()
    }
    
    func testSalesLog() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { vendingMachine.fill(beverage: $0) }
        
        vendingMachine.insert(money: 2000)
        vendingMachine.sell(beverage: "Coke")
        
        var salesLog = [Beverage]()
        vendingMachine.repeatForSalesLog { salesLog.append($0) }
        XCTAssert(salesLog[0] === items[1])
    }
}
