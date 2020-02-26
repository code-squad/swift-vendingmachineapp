//
//  VendingMachineTests.swift
//  VendingMachineAppTests
//
//  Created by 신한섭 on 2020/02/26.
//  Copyright © 2020 신한섭. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTests: XCTestCase {
    let machine = VendingMachine()
    let coke = Coke(brand: "coca-cola", capacity: 355, price: 1000, name: "coca-cola", manufacturingDate: Date(), expirationDate: Date(), calorie: 100, hot: false, zeroCalorie: false, strongCarbonicAcid: false)
    let chocoMilk = ChocolateMilk(brand: "seoulMilk", capacity: 150, price: 2000, name: "seoulMilk", manufacturingDate: Date(), expirationDate: Date(), calorie: 112, hot: false, farmCode: "AB110", package: .paper)
    let georgia = Georgia(brand: "coca-cola", capacity: 200, price: 1200, name: "georgia", manufacturingDate: Date(), expirationDate: Date(), calorie: 50, hot: true, decaffeinated: false, black: false)
    
    override func setUp() {
        machine.insertBeverage(beverage: coke)
        machine.insertBeverage(beverage: chocoMilk)
        machine.insertBeverage(beverage: georgia)
        machine.addBalance(balance: 1000)
    }

    func testInsertBeverage() {
        var matchCount = 0
        
        machine.forEachBeverages{
            if $0 == coke {
                matchCount += 1
            }
        }
        
        XCTAssertEqual(matchCount, 1)
    }
    
    func testAddBalance() {
        XCTAssertEqual(machine.getBalance(), 1000)
    }
    
    func testPurchasableBeverages() {
        XCTAssertEqual(machine.purchasableBeverages().count, 1)
    }
    
    func testPurchase() {
        machine.purchase(beverage: coke)
        XCTAssertEqual(machine.getBalance(), 0)
        
        var historyCount = 0
        var remainsCount = 0
        
        machine.forEachBeverages {_ in
            remainsCount += 1
        }
        
        XCTAssertEqual(remainsCount, 2)
        
        machine.forEachPurchasedHistory {_ in
            historyCount += 1
        }
        
        XCTAssertEqual(historyCount, 1)
    }
    
    func testHotBeverages() {
        XCTAssertEqual(machine.hotBeverages().count, 1)
    }
    
    func testPurchasedBeverages() {
        machine.purchase(beverage: coke)
        XCTAssertEqual(machine.purchasedBeverages().count, 1)
    }
}
