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
    let beverage = Beverage(manufacturer: "제조사", brand: "브랜드", capacity: 200, price: 2000, name: "음료", manufacturedDate: Date(), expirationDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, isHot: false)
    
    func testIsHot() {
        XCTAssertFalse(beverage.verifyHotBeverage())
    }
    
    func testManufacturedDateString() {
        XCTAssertEqual(beverage.dateToString(beverage.manufacturedDate), "20200305")
    }
    

    
}
