//
//  VendingMachine.swift
//  Test
//
//  Created by Jun Ho JANG on 2021/03/03.
//

import XCTest
@testable import VendingMachineApp

class test: XCTestCase {
    
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
    }

    func testExample() {
        let cash = 100
        vendingMachine.insertCash(cash: cash)
        let expect = 100
        XCTAssertEqual(expect, vendingMachine.showAccount(), "not equal")
    }

}
