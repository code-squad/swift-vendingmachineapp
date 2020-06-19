//
//  MilkTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

final class MilkTest: XCTestCase {
    var milk: Milk!
    
    override func setUp() {
        super.setUp()
        milk = HersheyChocolateDrink(
            cacaoContentRate: 0.03,
            name: "쿠키앤크림",
            volume: 235,
            price: 1300
        )
    }
    
    override func tearDown() {
        milk = nil
        super.tearDown()
    }
    
    func testValidateSuccess() {
        if let date = Date.dateFormatter.date(from: "20191120") {
            XCTAssertTrue(milk.validate(with: date))
        }
    }
    
    func testValidateFail() {
        if let date = Date.dateFormatter.date(from: "20201228") {
            XCTAssertFalse(milk.validate(with: date))
        }
    }
}
