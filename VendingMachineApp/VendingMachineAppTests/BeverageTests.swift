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
        guard let cider = BeverageFactory.produce(of: Cider.self) else { return }
        XCTAssertFalse(cider.isHot(temparature: 60))
        XCTAssertFalse(cider.isLowCalorie(calories: 20))
        XCTAssertFalse(cider.isExpired(now: Date()))
    }
}
