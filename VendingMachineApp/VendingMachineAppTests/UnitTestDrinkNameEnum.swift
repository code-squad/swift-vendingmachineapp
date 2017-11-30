//
//  UnitTestDrinkNameEnum.swift
//  VendingMachineAppTests
//
//  Created by yangpc on 2017. 11. 30..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class UnitTestDrinkNameEnum: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDrinkNameEnum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var drinkNames: [String] = [String]()
        for drinkName in DrinkName.allCases {
            drinkNames.append(drinkName.description)
        }
        XCTAssertEqual(drinkNames[0], "strawBerryMilk")
        XCTAssertEqual(drinkNames[1], "bananaMilk")
    }

}
