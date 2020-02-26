//
//  BeverageTests.swift
//  VendingMachineAppTests
//
//  Created by 신한섭 on 2020/02/26.
//  Copyright © 2020 신한섭. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class BeverageTests: XCTestCase {
    let someBeverage = Beverage(brand: "bevereage", capacity: 355, price: 1000, name: "bevereage", manufacturingDate: Date(), expirationDate: Date(timeIntervalSinceNow: -800000), calorie: 100, hot: false)
    
        let someSomeBeverage = Beverage(brand: "bevereage", capacity: 355, price: 200, name: "bevereage", manufacturingDate: Date(), expirationDate: Date(timeIntervalSinceNow: 800000), calorie: 100, hot: true)
    
    func testCanBuy() {
        XCTAssertFalse(someBeverage.canBuy(have: 300))
        XCTAssertTrue(someSomeBeverage.canBuy(have: 300))
    }
    
    func testIsSafe() {
        XCTAssertFalse(someBeverage.isSafe())
        XCTAssertTrue(someSomeBeverage.isSafe())
    }
    
    func testGetPrice() {
        XCTAssertEqual(someBeverage.getPrice(), 1000)
    }
    
    func testIsHot() {
        XCTAssertFalse(someBeverage.isHot())
        XCTAssertTrue(someSomeBeverage.isHot())
    }
}
