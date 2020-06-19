//
//  SodaTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

final class SodaTest: XCTestCase {
    var soda: Soda!
    
    override func setUp() {
        super.setUp()
        soda = Pepsi(
            package: Pepsi.Package.can,
            kiloCalorie: 80,
            name: "다이어트 콜라",
            volume: 250,
            price: 1200
        )
    }
    
    override func tearDown() {
        soda = nil
        super.tearDown()
    }
    
    func testIsLowCalorieTrue() {
        XCTAssertTrue(soda.isLowCalorie())
    }
    
    func testIsLowCalorieFalse() {
        soda = Pepsi(
            package: Pepsi.Package.pet,
            kiloCalorie: 120,
            name: "다이어트 콜라",
            volume: 591,
            price: 2000
        )
        XCTAssertFalse(soda.isLowCalorie())
    }
}
