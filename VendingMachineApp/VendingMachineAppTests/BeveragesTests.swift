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
    let coffee = StarbucksCoffee(manufacturer: "동서식품", brand: "스타벅스", capacity: 355, price: 2700, name: "스타벅스 모카", manufacturedDate: Date(), expirationDate:  Calendar.current.date(byAdding: .day, value: 7, to: Date())!)
    let soda = Coke(manufacturer: "코카콜라", brand: "코카콜라", capacity: 200, price: 2000, name: "코카콜라", manufacturedDate: Date(), expirationDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!)
    let milk = StrawberryMilk(manufacturer: "서울우유", brand: "서울우유", capacity: 200, price: 1200, name: "딸기맛 우유", manufacturedDate: Date(), expirationDate:  Calendar.current.date(byAdding: .day, value: 7, to: Date())!)
    
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
