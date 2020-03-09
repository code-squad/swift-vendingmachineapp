//
//  BeveragesTests.swift
//  VendingMachineAppTests
//
//  Created by delma on 05/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import XCTest
@testable import VendingMachineApp
class BeveragesTests: XCTestCase {
    var beverages = Beverages()
    let coffee = Mocha(manufacturer: "동서식품", brand: "스타벅스", capacity: 355, price: Money(balance: 2700), name: "스타벅스 모카", manufacturedDate: Date(), expirationDate:  Date(), isContainMilk: true, package: .glass, temperature: 8, wheepCreamAmount: 30)
    let soda = Coke(manufacturer: "코카콜라", brand: "코카콜라", capacity: 200, price: Money(balance: 2000), name: "코카콜라", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .lower, temperature: 2, cocaLeafRatio: 8.8)
    let milk = StrawberryMilk(manufacturer: "서울우유", brand: "서울우유", capacity: 200, price: Money(balance: 1200), name: "딸기맛 우유", manufacturedDate: Date(), expirationDate:  Date(), fatRatio: .original, temperature: 8, strawberryConcentrateRatio: 15.0)
    
    override func setUp() {
        beverages.addBeverage(coffee)
        beverages.addBeverage(soda)
        beverages.addBeverage(milk)
    }
    
    func testAddBeverage() {
        beverages.addBeverage(soda)
        let stockList = beverages.reportKindWithCount()
        
        XCTAssertEqual(stockList[coffee], 1)
        XCTAssertEqual(stockList[soda], 2)
        XCTAssertEqual(stockList[milk], 1)
    }
    
    func testRemoveBeverage() {
        beverages.removeBeverage(soda)
        beverages.removeBeverage(milk)

        let stockList = beverages.reportKindWithCount()
        XCTAssertEqual(stockList[coffee], 1)
        XCTAssertEqual(stockList[soda], nil)
        XCTAssertEqual(stockList[milk], nil)
    }
}
