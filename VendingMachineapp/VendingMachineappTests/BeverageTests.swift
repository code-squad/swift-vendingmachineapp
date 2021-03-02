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
        
        let milk1: Milk = StrawberryMilk(manufacturer: "서울우유",
                                         volume: 200, price: 1000,
                                         brand: "날마다딸기우유",
                                         manufactured: Date.stringToDate(date: "20171009"),
                                         expirydate: Date.stringToDate(date: "20210228"),
                                         calorie: 200,
                                         temperature: 10,
                                         lowFat: false)
        
        let milk2: Milk = StrawberryMilk(manufacturer: "서울우유",
                                         volume: 200, price: 1000,
                                         brand: "날마다딸기우유",
                                         manufactured: Date.stringToDate(date: "20171009"),
                                         expirydate: Date.stringToDate(date: "20210220"),
                                         calorie: 200,
                                         temperature: 10,
                                         lowFat: false)
        
        let soda: Soda = Coke(manufacturer: "팹시",
                              volume: 350,
                              price: 2000,
                              brand: "다이어트콜라",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expirydate: Date.stringToDate(date: "20221005"),
                              calorie: 100,
                              temperature: 10,
                              flavor: "콜라맛")

        let coffee: Coffee = Top(manufacturer: "맥심",
                                 volume: 400,
                                 price: 3000,
                                 brand: "TOP아메리카노",
                                 manufactured: Date.stringToDate(date: "20171010"),
                                 expirydate: Date.stringToDate(date: "20211231"),
                                 calorie: 350,
                                 temperature: 10,
                                 caffeineContent: 20)
        
        XCTAssertEqual(milk1.isHot(with: 50), false)
        XCTAssertEqual(milk2.isLowFat(), false)
        XCTAssertEqual(soda.isLowCalorie(with: 300), true)
        XCTAssertEqual(coffee.validateExpiryTime(with: Date()), true)
    }
}
