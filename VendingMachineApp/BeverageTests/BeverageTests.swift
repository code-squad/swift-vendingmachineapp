//
//  BeverageTests.swift
//  BeverageTests
//
//  Created by TTOzzi on 2020/02/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

@testable import VendingMachineApp
import XCTest

class BeverageTests: XCTestCase {

    func testMilk() {
        let milk = BananaMilk(brand: "빙그레", amount: 240, price: Money(amount: 1000), name: "바나나맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 15, bananaContent: 3)
        XCTAssertFalse(milk.isLowFat())
        XCTAssertFalse(milk.isLowCalorie())
        XCTAssertFalse(milk.isHot)
        XCTAssertTrue(milk.validate(with: Date()))
        XCTAssertFalse(milk.validate(with: Calendar.current.date(byAdding: .day, value: 20, to: Date())!))
    }
    
    func testCoffee() {
        let coffee = Cantata(brand: "롯데", amount: 500, price: Money(amount: 3000), name: "콘트라베이스 콜드브루", calorie: 20, saleablePeriod: 270, caffeineContent: 179, isHot: true)
        XCTAssertTrue(coffee.isLowCalorie())
        XCTAssertTrue(coffee.isHot)
        XCTAssertFalse(coffee.isDecaffeinated())
        XCTAssertTrue(coffee.validate(with: Date()))
        XCTAssertFalse(coffee.validate(with: Calendar.current.date(byAdding: .day, value: 300, to: Date())!))
    }
    
    func testSoda() {
        let soda = Cola(brand: "코카콜라", amount: 355, price: Money(amount: 1500), name: "코카콜라 제로", calorie: 0, saleablePeriod: 100, sugarContent: 0)
        XCTAssertTrue(soda.isZeroCola())
        XCTAssertTrue(soda.isLowCalorie())
        XCTAssertFalse(soda.isHot)
        XCTAssertTrue(soda.isUnsweetened())
        XCTAssertTrue(soda.validate(with: Calendar.current.date(byAdding: .day, value: 99, to: Date())!))
        XCTAssertFalse(soda.validate(with: Calendar.current.date(byAdding: .day, value: 101, to: Date())!))
    }
}
