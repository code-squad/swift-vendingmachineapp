//
//  BeverageTests.swift
//  BeverageTests
//
//  Created by TTOzzi on 2020/02/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

@testable import VendingMachineApp
import XCTest

class BeverageTests: XCTestCase {

    func testMilk() {
        let milk = BananaMilk(brand: "빙그레", amount: 240, price: 1000, name: "바나나맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 15, bananaContent: 3)
        XCTAssertFalse(milk.isLowFat())
        XCTAssertFalse(milk.isLowCalorie())
        XCTAssertFalse(milk.isHot)
        XCTAssertTrue(milk.validate(with: Date()))
        XCTAssertFalse(milk.validate(with: Calendar.current.date(byAdding: .day, value: 20, to: Date())!))
    }
}
