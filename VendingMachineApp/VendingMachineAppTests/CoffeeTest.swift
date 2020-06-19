//
//  CoffeeTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

final class CoffeeTest: XCTestCase {
    var coffee: Coffee!
    
    override func setUp() {
        super.setUp()
        coffee = Cantata(
            milkContentRate: 0.15,
            sugarContentRate: 0.05,
            celsius: 65,
            name: "프리미엄 라떼",
            volume: 175,
            price: 1500
        )
    }
    
    override func tearDown() {
        coffee = nil
        super.tearDown()
    }
    
    func testIsHotTrue() {
        XCTAssertTrue(coffee.isHot())
    }
    
    func testIsHotFalse() {
        coffee = Cantata(
            milkContentRate: 0.15,
            sugarContentRate: 0.05,
            celsius: 55,
            name: "프리미엄 라떼",
            volume: 175,
            price: 1500
        )
        XCTAssertFalse(coffee.isHot())
    }
}
