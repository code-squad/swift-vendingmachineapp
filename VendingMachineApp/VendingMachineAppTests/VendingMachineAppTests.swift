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
    
    func testBeverageFactory() throws {
        let BF : BeverageCreater = BeverageCreater()
        XCTAssertEqual(BF.makeBeverage(beveragetype: BananaMilk.self, manufactured: Date().makeDatewithString(yyyyMMdd: "20200301")), BF.makeBeverage(beveragetype: Coke.self, manufactured: Date().makeDatewithString(yyyyMMdd: "20210301")))
    }
}
