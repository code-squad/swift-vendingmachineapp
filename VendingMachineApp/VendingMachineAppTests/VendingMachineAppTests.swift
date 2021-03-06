//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 박정하 on 2021/03/03.
//

import XCTest

class VendingMachineAppTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }
    
    func testValidate() throws {
        let testArray : [Beverage] = [BeverageCreater().makeHOT6(Date().stringTodate("20210225"))]
        let testclass : testClass = testClass()
        let vendingMachine : VendingMachine = VendingMachine.init(Money: Money.init(money: 2000))
        testclass.beverageList.forEach{vendingMachine.addBeverage(beverage: $0)}
        XCTAssertEqual(vendingMachine.isValidateList(), testArray)
    }
    
    func testHotBeverage() throws {
        let testArray : [Beverage] = [BeverageCreater().makeCaffeMocha(Date().stringTodate("20200226")),
                                      BeverageCreater().makeCaffeLatte(Date().stringTodate("20200227"))]
        let testclass : testClass = testClass()
        let vendingMachine : VendingMachine = VendingMachine.init(Money: Money.init(money: 1000))
        testclass.beverageList.forEach{vendingMachine.addBeverage(beverage: $0)}
        XCTAssertEqual(vendingMachine.isHotList(), testArray)
    }
    
    func testcanBuyBeverage() throws {
        let testArray : [Beverage] = [BeverageCreater().makeHOT6(Date().stringTodate("20210225"))]
        let testclass : testClass = testClass()
        let vendingMachine : VendingMachine = VendingMachine.init(Money: Money.init(money: 2000))
        testclass.beverageList.forEach{vendingMachine.addBeverage(beverage: $0)}
        XCTAssertEqual(vendingMachine.canBuyBeverageList(), testArray)
    }
}
