//
//  VendingMachineTests.swift
//  VendingMachineTests
//
//  Created by TTOzzi on 2020/02/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

@testable import VendingMachineApp
import XCTest

class VendingMachineTests: XCTestCase {

    var myVendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        myVendingMachine = VendingMachine()
    }
    
    func testPutMoney() {
        myVendingMachine.putMoney(3000)
        XCTAssertEqual(myVendingMachine.money, 3000) 
    }
}
