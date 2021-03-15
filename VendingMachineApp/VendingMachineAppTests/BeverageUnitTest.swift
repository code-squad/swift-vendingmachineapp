//
//  BeverageUnitTest.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/02/28.
//
import XCTest

class BeverageUnitTest: XCTestCase {
    var someBeverage: Beverage!
    
    override func setUp() {
        super.setUp()
        someBeverage = BeverageFactory.makeBeverageWithType(brand: "동아제약", price: .high, name: "박카스", packageTime: .fresh, beverageType: Beverage.self)
    }
    
    override func tearDown() {
        someBeverage = nil
        super.tearDown()
    }
    
    func test_cheap_beverages_are_purchasable() {
    }
    
    func test_expensive_beverages_are_not_purchasable() {
        let highestPriceAmongCheapBeverage: Int = 4999
        let hugeAmountOfMoney: Int = 999_999
        XCTAssertFalse(someBeverage.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertTrue(someBeverage.isPurchasable(with: hugeAmountOfMoney))
    }
    
    
    func test_old_beverages_are_expired() {
    }
    
    func test_fresh_beverages_are_not_expired() {
        XCTAssertFalse(someBeverage.isExpired(on: Date()))
    }
    
    func test_hot_beverages_are_hot() {
    }
    
    func test_normal_beverages_are_not_hot() {
    }
    
    func test_highCaffeine_beverages_contain_highCaffein() {
    }
    
    func test_beverages_with_highCaffeine_and_foodColoring_are_bad_for_body() {
    }
    
    func test_beverages_with_highCaffeine_and_noFoodColoring_are_not_bad_for_body() {
    }
    
    func test_hot_beverages_with_highCaffeine_are_energyBoosting() {
    }
    
    func test_hot_but_lowCaffeine_beverages_are_not_energyBoosting() {
    }
}
