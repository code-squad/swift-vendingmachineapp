//
//  BeverageTests.swift
//  VendingMachineAppTests
//
//  Created by delma on 05/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class BeverageTests: XCTestCase {
    let beverage = Beverage(manufacturer: "제조사", brand: "브랜드", capacity: 200, price: 2000, name: "음료", manufacturedDate: Date(), expirationDate: Date(), temperature: 10)
    
    func testIsHot() {
        XCTAssertFalse(beverage.verifyHotBeverage())
    }
    
    
}
