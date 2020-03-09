//
//  VendingMachineTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTest: XCTestCase {

    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        let primiumLatte = Cantata(volume: 275, price: 2200,
                                   name: "프리미엄 라떼",
                                   manufacturingDateInfo: "20200102",
                                   hotState: true)!
        let dietCola = Pepsi(volume: 350, price: 2000, name: "다이어트 콜라",
                             manufacturingDateInfo: "20190928", kiloCalorie: 80)!
        let cookieCreamMilk = HersheyChocolateDrink(volume: 190, price: 1500,
                                                name: "쿠키 앤 크림",
                                                manufacturingDateInfo: "20191116",
                                                expirationDateInfo: "20191123")!
        
        vendingMachine = VendingMachine(stock: [primiumLatte, dietCola, cookieCreamMilk])
    }

    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }
    
    func testHotCoffees() {
        let hotCoffees = vendingMachine.hotCoffees()
        let primiumLatte = Cantata(volume: 275, price: 2200,
                                   name: "프리미엄 라떼",
                                   manufacturingDateInfo: "20200102",
                                   hotState: true)
        XCTAssertEqual(hotCoffees, [primiumLatte])
    }
}
