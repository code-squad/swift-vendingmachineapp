//
//  CoffeeTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class CoffeeTest: XCTestCase {

    var coffee: Coffee!
    
    override func setUp() {
        super.setUp()
        coffee = Cantata(volume: 275, price: 2200,
        name: "프리미엄 라떼",
        manufacturingDateInfo: "20200102",
        isHot: true)
    }

    override func tearDown() {
        coffee = nil
        super.tearDown()
    }
    
    func testIsHotTrue() {
        XCTAssertTrue(coffee.isHot())
    }
    
    func testIsHotFalse() {
        coffee = Cantata(volume: 275, price: 2200,
        name: "프리미엄 라떼",
        manufacturingDateInfo: "20200102",
        isHot: false)
        XCTAssertFalse(coffee.isHot())
    }
    
}
