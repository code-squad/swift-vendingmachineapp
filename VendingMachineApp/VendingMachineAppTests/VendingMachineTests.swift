//
//  VendingMachineTest.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/08.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTests: XCTestCase {
    var testMachine: VendingMachine!
    
    override func setUp() {
        testMachine = VendingMachine()
    }
    
    func testInsert() {
        testMachine.insert(money: 2000)
        XCTAssertEqual(testMachine.showBalance(), 2000)
    }
    
    func testAddBeverages() {
        let nextMonth = "20210401"
        
        testMachine.add(type: .BananaMilk, expireDate: nextMonth)
        testMachine.add(type: .BananaMilk, expireDate: nextMonth)
        XCTAssertEqual(testMachine.showAllStock(), [BananaMilk(expireDate: nextMonth):2])
    }
    
    func testPurchase() {
        let nextMonth = "20210401"
        
        testMachine.add(type: .BananaMilk, expireDate: nextMonth)
        testMachine.add(type: .BananaMilk, expireDate: nextMonth)
        
        testMachine.insert(money: 2000)
        let b = testMachine.showPurchasableBeverages().first
        XCTAssertEqual(testMachine.purchase(beverage: b!), b)
        XCTAssertEqual(testMachine.showBalance(), 600)
        XCTAssertEqual(testMachine.showPurchaseHistory(), [b!])
    }
    
    func testStock() {
        let lastMonth = "20210201"
        let nextMonth = "20210401"
        
        testMachine.add(type: .BananaMilk, expireDate: nextMonth)
        testMachine.add(type: .BananaMilk, expireDate: lastMonth)
        testMachine.add(type: .CaffeLatte, expireDate: nextMonth)

        XCTAssertEqual(testMachine.showAllStock(), [BananaMilk(expireDate: nextMonth):2])
        XCTAssertEqual(testMachine.showExpiredBeverages(), [BananaMilk(expireDate: lastMonth)])
        
        XCTAssertEqual(testMachine.showHotBeverages(), [CaffeLatte(expireDate: nextMonth)])
    }
    
     
//    func testVendingMachine(){
//        let vend = VendingMachine()
//
//        vend.add(type: .BananaMilk, expireDate: "20211231")
//        vend.insert(money: 2000)
////        XCTAssert(vend.showAllStock())
////
////
////        vend.add(type: .CaffeLatte, expireDate: "20201231")
////        vend.add(type: .Coke, expireDate: "20211231")
////        vend.add(type: .EnergyDrink, expireDate: "20211231")
////
//    }
}
