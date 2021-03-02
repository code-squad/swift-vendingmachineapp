//
//  BeverageTests.swift
//  VendingMachineappTests
//
//  Created by 심영민 on 2021/02/27.
//

import Foundation

import XCTest

@testable import VendingMachineapp

class BeverageTests: XCTestCase {
 
    func testBeverage() {
        
        let milk = MilkFactory.createBeverage(
                             manufacturer: "서울우유",
                             volume: 200, price: 1000,
                             brand: "날마다딸기우유",
                             manufactured: Date.stringToDate(date: "20171009"),
                             expiry: Date.stringToDate(date: "20210227"),
                             calorie: 200,
                             temperature: 10,
                             ofType: StrawberryMilk.self)!
        
        let coke = SodaFactory.createBeverage(
                            manufacturer: "팹시",
                            volume: 350,
                            price: 2000,
                            brand: "다이어트콜라",
                            manufactured: Date.stringToDate(date: "20171005"),
                            expiry: Date.stringToDate(date: "20221005"),
                            calorie: 100,
                            temperature: 10,
                            ofType: Coke.self)!

        let top = CoffeeFactory.createBeverage(
                             manufacturer: "맥심",
                             volume: 300,
                             price: 3500,
                             brand: "TOP아메리카노",
                             manufactured: Date.stringToDate(date: "20210110"),
                             expiry: Date.stringToDate(date: "20210330"),
                             calorie: 350,
                             temperature: 20,
                             ofType: Top.self)!
        
        XCTAssertEqual(milk.isHot(with: 50), false)
        //XCTAssertEqual(milk.isLowFat(with: 200), false)
        XCTAssertEqual(coke.isLowCalorie(with: 300), true)
        XCTAssertEqual(top.validateExpiryTime(with: Date()), true)
    }
}
