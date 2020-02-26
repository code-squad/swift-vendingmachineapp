//
//  BeverageTests.swift
//  VendingMachineAppTests
//
//  Created by 신한섭 on 2020/02/26.
//  Copyright © 2020 신한섭. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class BeveragesTests: XCTestCase {
    
    let beverages = Beverages()
    let coke = Coke(brand: "coca-cola", capacity: 355, price: 1000, name: "coca-cola", manufacturingDate: Date(), expirationDate: Date(), calorie: 100, hot: false, zeroCalorie: false, strongCarbonicAcid: false)
    let chocoMilk = ChocolateMilk(brand: "seoulMilk", capacity: 150, price: 2000, name: "seoulMilk", manufacturingDate: Date(), expirationDate: Date(), calorie: 112, hot: false, farmCode: "AB110", package: .paper)
    let georgia = Georgia(brand: "coca-cola", capacity: 200, price: 1200, name: "georgia", manufacturingDate: Date(), expirationDate: Date(), calorie: 50, hot: true, decaffeinated: false, black: false)
    
    override func setUp() {
        beverages.addBeverage(beverage: coke)
        beverages.addBeverage(beverage: chocoMilk)
        beverages.addBeverage(beverage: georgia)
    }
    
    func testAddBeverage() {
        beverages.addBeverage(beverage: coke)
        var beveragesCount = 0
        
        beverages.forEachBeverages {_ in
            beveragesCount += 1
        }
        
        XCTAssertEqual(beveragesCount, 4)
    }
    
    func testRemoveBeverage() {
        beverages.removeBeverage(beverage: chocoMilk)
        
        var beveragesCount = 0
        
        beverages.forEachBeverages {_ in
            beveragesCount += 1
        }
        
        XCTAssertEqual(beveragesCount, 2)
    }
}
