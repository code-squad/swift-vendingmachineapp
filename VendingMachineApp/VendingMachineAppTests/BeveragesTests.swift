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
    
    var milk: Milk?
    var coffee: Coffee?
    
    override func setUp() {
        milk = Milk(manufacture: "",
                    size: 0,
                    price: 0,
                    name: "",
                    farmCode: .incheonRhinoFarm)
    }
    
    func testValidMilk() {
        XCTAssertTrue(milk?.validate(with: Date()) ?? false)
    }
    
    func testInvalidMilk() {
        let eightDays = DateComponents(day: 8)
        let eightDaysPassedFromNow = Calendar.current.date(byAdding: eightDays, to: Date())!
        XCTAssertFalse(milk?.validate(with: eightDaysPassedFromNow) ?? true)
    }
    
    func testEnergyDrinkReplaceableCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 120,
                            temperature: 0)
        XCTAssertTrue(coffee.canReplaceEnergyDrinks())
    }
    
    func testEnergyDrinkNotReplaceableCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 32,
                            temperature: 0)
        XCTAssertFalse(coffee.canReplaceEnergyDrinks())
    }
    
    func testHotCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 0,
                            temperature: 99)
        XCTAssertTrue(coffee.isHot())
    }
    
    func testIceCoffee() {
        let coffee = Coffee(manufacturer: "",
                            size: 0,
                            price: 0,
                            name: "",
                            caffeineContent: 32,
                            temperature: 5)
        XCTAssertFalse(coffee.isHot())
    }
}
