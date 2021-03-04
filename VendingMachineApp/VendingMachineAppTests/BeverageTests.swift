//
//  BeverageTests.swift
//  VendingMachineAppTests
//
//  Created by zombietux on 2021/03/02.
//

import XCTest
@testable import VendingMachineApp

class BeverageTests: XCTestCase {
    func testBeverageInterface() {
        let ciderFactory = CiderFactory()
        XCTAssertFalse(ciderFactory.produce().isHot())
        XCTAssertFalse(ciderFactory.produce().isLowCalorie())
        XCTAssertFalse(ciderFactory.produce().isExpired(now: Date()))
    }
}
