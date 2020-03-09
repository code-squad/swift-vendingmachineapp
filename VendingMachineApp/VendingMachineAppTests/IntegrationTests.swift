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
    var cashier: Cashier!
    
    override func setUp() {
        cashier = Cashier()
        vendingMachine = VendingMachine(cashier: cashier)
    }
    
    func testVendingMachine() {
        vendingMachine.insert(money: 1000)
        vendingMachine.insert(money: 5000)
        
        let items = [StrawberryMilk(), StrawberryMilk(), Coke(), Fanta(), Top(), Top()]
        items.forEach { vendingMachine.fill(beverage: $0) }
        
        vendingMachine.sell(beverage: "StrawberryMilk")
        vendingMachine.sell(beverage: "Top")
        
        var salesLog = [Beverage]()
        vendingMachine.repeatForSalesLog { salesLog.append($0) }
        XCTAssertEqual(salesLog, [StrawberryMilk(), Top()])
    }
}
