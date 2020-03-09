//
//  MilkTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class MilkTest: XCTestCase {
    
    var milk: Milk!
    
    override func setUp() {
        super.setUp()
        milk = HersheyChocolateDrink(volume: 190, price: 1500,
                                     name: "쿠키 앤 크림",
                                     manufacturingDateInfo: "20191116",
                                     expirationDateInfo: "20191123")
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
        if let date = Date.dateFormatter.date(from: "20191128") {
            XCTAssertFalse(milk.validate(with: date))
        }
    }
    
}
