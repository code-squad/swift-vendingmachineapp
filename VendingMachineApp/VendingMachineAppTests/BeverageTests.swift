//
//  BeverageTests.swift
//  VendingMachineApp
//
//  Created by Viet on 2020/03/10.
//  Copyright © 2020 Viet. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class BeverageTests: XCTestCase {
    func testNewBeverage() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        let beverage = Beverage(name: "날마다딸기우유", price: 1000, capacity: 200, brand: "서울우유", productionDate: dateFormatter.date(from: "20171009")!)

        XCTAssertEqual(beverage.description, "서울우유, 200ml, 1000원, 날마다딸기우유, 20171009")
    }
}
