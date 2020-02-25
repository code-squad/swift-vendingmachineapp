//
//  BeverageUnitTests.swift
//  VendingMachineUnitTests
//
//  Created by Cory Kim on 2020/02/25.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest

class BeverageUnitTests: XCTestCase {

    let chocoMilk = ChocolateMilk(name: "서울우유 초코맛", brand: "서울우유", servingSize: 120, price: Money(1500), manufactureDate: Date(), expirationDate: Date(timeIntervalSinceNow:86400), farmCode: "AEKS1238", cacaoContentRate: 80)
    
    override func setUp() {
        
    }

    func testDate() {
        XCTAssert(chocoMilk.manufactureDate.dateFormatString() == "2020-02-25")
    }
}
