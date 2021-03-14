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
    
    func testDateFormatter() throws {
        let date = Date().makeDatewithString(yyyyMMdd: "20210302").descriptDateToString()
        XCTAssertEqual(date, "20210302")
    }
    
    func testFactory() throws{
        let BF : BeverageCreater = BeverageCreater()
        XCTAssertEqual(BF.makeBeverage(beveragetype: BananaMilk.self, Date().makeDatewithString(yyyyMMdd: "20200303")) ,BF.makeBeverage(beveragetype: Coke.self, Date().makeDatewithString(yyyyMMdd: "20200303")))
    }
    
    func testsendImageView() throws{
        let VM : VendingMachine = VendingMachine(Money: Money.init(money: 1000))
        let tempimagesViews : [UIImageView] = []
    }
    
    func testbeverage() throws{
        let VM : VendingMachine = VendingMachine(Money: Money.init(money: 1000))
        let views : [ObjectIdentifier : Int] = [:]
    }
    
    func testBeverageFactory() throws {
        let BF : BeverageCreater = BeverageCreater()
        XCTAssertEqual(BF.makeBeverageTest(beveragetype: BananaMilk.self), BF.makeBeverage(beveragetype: Coke.self, Date().makeDatewithString(yyyyMMdd: "20200303")))
    }
}
