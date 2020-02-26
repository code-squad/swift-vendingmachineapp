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
    let coke = Coke(brand: "coca-cola", capacity: 355, price: 1000, name: "coca-cola", manufacturingDate: Date(), expirationDate: Date(), calorie: 100, temperature: 10, zeroCalorie: false, carbonicAcid: 10)
    let chocoMilk = ChocolateMilk(brand: "seoulMilk", capacity: 150, price: 2000, name: "seoulMilk", manufacturingDate: Date(), expirationDate: Date(), calorie: 112, temperature: 10, farmCode: "AB110", package: .paper)
    let georgia = Georgia(brand: "coca-cola", capacity: 200, price: 1200, name: "georgia", manufacturingDate: Date(), expirationDate: Date(), calorie: 50, temperature: 67, decaffeinated: false, black: false)
    
    override func setUp() {
        beverages.add(beverage: coke)
        beverages.add(beverage: chocoMilk)
        beverages.add(beverage: georgia)
    }
    
    func testAddBeverage() {
        beverages.add(beverage: coke)
        var beveragesCount = 0
        
        beverages.forEachBeverages {_ in
            beveragesCount += 1
        }
        
        XCTAssertEqual(beveragesCount, 4)
    }
    
    func testRemoveBeverage() {
        beverages.remove(beverage: chocoMilk)
        
        var beveragesCount = 0
        
        beverages.forEachBeverages {_ in
            beveragesCount += 1
        }
        
        XCTAssertEqual(beveragesCount, 2)
    }
}
