//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class BeveragesTests: XCTestCase {
    
    var milk: Milk?
    
    override func setUp() {
        milk = Milk(manufacture: "매일유업",
                    size: 0,
                    price: 0,
                    name: "",
                    farmCode: .incheonRhinoFarm)
    }
    
    func testValidMilk() {
        XCTAssertTrue(milk?.validate(with: Date()) ?? false)
    }
    
    func testInvalidMilk() {
        let eightDays = DateComponents(day: 8)
        let eightDaysPassedFromNow = Calendar.current.date(byAdding: eightDays, to: Date())!
        XCTAssertFalse(milk?.validate(with: eightDaysPassedFromNow) ?? true)
    }
}
