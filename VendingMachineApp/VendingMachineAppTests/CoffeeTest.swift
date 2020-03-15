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
        coffee = Cantata(cantataBuilder: Cantatas.builderPrimiumLatte175ml,
                         manufacturingDateInfo: "20200102",
                         celsius: 65)!
        
    }
    
    override func tearDown() {
        coffee = nil
        super.tearDown()
    }
    
    func testIsHotTrue() {
        XCTAssertTrue(coffee.isHot())
    }
    
    func testIsHotFalse() {
        coffee = Cantata(cantataBuilder: Cantatas.builderPrimiumLatte175ml,
                         manufacturingDateInfo: "20200102",
                         celsius: 55)!
        XCTAssertFalse(coffee.isHot())
    }
    
}
