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
        soda = Pepsi(pepsiBuilder: Pepsis.builderDietCola250ml)
    }
    
    override func tearDown() {
        soda = nil
        super.tearDown()
    }
    
    func testIsLowCalorieTrue() {
        XCTAssertTrue(soda.isLowCalorie())
    }
    
    func testIsLowCalorieFalse() {
        soda = Pepsi(pepsiBuilder: Pepsis.builderDietCola591ml)
        XCTAssertFalse(soda.isLowCalorie())
    }
    
}
