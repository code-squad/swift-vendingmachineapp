//
//  VendingMachineAppUnitTests.swift
//  VendingMachineAppUnitTests
//
//  Created by moon on 2018. 6. 24..
//  Copyright © 2018년 moon. All rights reserved.
//

import XCTest

class VendingMachineAppUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFactory_makeCoke() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: Coke.self), Coke())
    }
    
    func testFactory_makeSprite() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: Sprite.self), Sprite())
    }
    
    func testFactory_makeCantata() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: Cantata.self), Cantata())
    }
    
    func testFactory_makeTOP() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: TOP.self), TOP())
    }
    
    func testFactory_makeGeorgia() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: Georgia.self), Georgia())
    }
    
    func testFactory_StrawberryMilk() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: StrawberryMilk.self), StrawberryMilk())
    }
    
    func testFactory_BananaMilk() {
        XCTAssertEqual(BeverageFactory.makeBeverage(beverageType: BananaMilk.self), BananaMilk())
    }
    
    func testFactory_typeCheck_notEqual() {
        XCTAssertNotEqual(BeverageFactory.makeBeverage(beverageType: BananaMilk.self), StrawberryMilk())
    }
    
    func testStock_init() {
        XCTAssertEqual(Stock(), Stock([]))
    }
    
    func testStock_init_hasNotSameBeverages() {
        XCTAssertNotEqual(Stock([Coke(), Coke(), Sprite()]), Stock([Coke(), Sprite(), Sprite()]))
    }
    
    func testStock_init_hasSameBeverages() {
        XCTAssertEqual(Stock([Coke(),Sprite()]), Stock([Coke(), Sprite()]))
    }
    
}
