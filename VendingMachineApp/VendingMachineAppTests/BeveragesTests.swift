//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class BeveragesTests: XCTestCase {
    
    var milk: Milk!
    
    override func setUp() {
        milk = Milk(manufacture: "",
                    size: 0,
                    price: 0,
                    name: "",
                    farmCode: .incheonRhinoFarm)
    }
    
    func testValidMilk() {
        XCTAssertTrue(milk.isValid(with: Date()))
    }
    
    func testInvalidMilk() {
        let eightDays = DateComponents(day: 8)
        let eightDaysPassedFromNow = Calendar.current.date(byAdding: eightDays, to: Date())!
        XCTAssertFalse(milk.isValid(with: eightDaysPassedFromNow))
    }
    
    func testEnergyDrinkReplaceableCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 120,
                            temperature: 0)
        XCTAssertTrue(coffee.canReplaceEnergyDrinks(threshold: 50))
    }
    
    func testEnergyDrinkNotReplaceableCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 32,
                            temperature: 0)
        XCTAssertFalse(coffee.canReplaceEnergyDrinks(threshold: 50))
    }
    
    func testHotCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 0,
                            temperature: 99)
        XCTAssertTrue(coffee.isHot(threshold: 80))
    }
    
    func testIceCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 32,
                            temperature: 5)
        XCTAssertFalse(coffee.isHot(threshold: 80))
    }
}
