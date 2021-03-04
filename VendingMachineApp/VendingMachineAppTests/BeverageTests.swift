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
        XCTAssertFalse(ciderFactory.produce().isHot(temparature: 60))
        XCTAssertFalse(ciderFactory.produce().isLowCalorie(calories: 20))
        XCTAssertFalse(ciderFactory.produce().isExpired(now: Date()))
    }
}
