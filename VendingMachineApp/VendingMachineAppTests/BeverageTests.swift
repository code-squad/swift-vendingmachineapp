//
//  BeverageTests.swift
//  VendingMachineAppTests
//
//  Created by 김지선 on 2021/03/08.
//

import XCTest
@testable import VendingMachineApp

class BeverageTests: XCTestCase {
    func testValidMilk() {
        let bananaMilk = BananaMilk(expireDate: "20211231")
        XCTAssertTrue(bananaMilk.isValid(with: Date()))
    }
    
    func testInvaildMilk() {
        let chocoMilk = ChocoMilk(expireDate: "20200101")
        XCTAssertFalse(chocoMilk.isValid(with: Date()))
    }
    
    func testHotCoffee() {
        let hotCoffee = CaffeLatte(expireDate: "20211231")
        XCTAssertTrue(hotCoffee.isHot())
    }
    
    func testIceCoffee() {
        let iceCoffee = Americano(expireDate: "20211231")
        XCTAssertFalse(iceCoffee.isHot())
    }
    
    func testHighCaffeine() {
        let energyDrink = EnergyDrink(expireDate: "20211231")
        XCTAssertTrue(energyDrink.isHighCaffeine())
    }
    
    func testLowCaffeine() {
        let milk = BananaMilk(expireDate: "20211231")
        XCTAssertFalse(milk.isHighCaffeine())
    }
}
