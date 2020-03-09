//
//  SodaTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class SodaTest: XCTestCase {
    
    var soda: Soda!
    
    override func setUp() {
        super.setUp()
        soda = Pepsi(volume: 350, price: 2000, name: "다이어트 콜라",
                     manufacturingDateInfo: "20190928", calorie: 80)
    }
    
    override func tearDown() {
        soda = nil
        super.tearDown()
    }
    
    func testIsLowCalorieTrue() {
        XCTAssertTrue(soda.isLowCalorie())
    }
    
    func testIsLowCalorieFalse() {
        soda = Pepsi(volume: 350, price: 2000, name: "표준 콜라",
                     manufacturingDateInfo: "20190928", calorie: 200)
        
        XCTAssertFalse(soda.isLowCalorie())
    }
}
