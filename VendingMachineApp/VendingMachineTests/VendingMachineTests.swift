//
//  VendingMachineTests.swift
//  VendingMachineTests
//
//  Created by TTOzzi on 2020/02/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

@testable import VendingMachineApp
import XCTest

class VendingMachineTests: XCTestCase {

    var myVendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        myVendingMachine = VendingMachine()
    }
    
    func testPutMoney() {
        myVendingMachine.putMoney(3000)
        XCTAssertEqual(myVendingMachine.money, 3000) 
    }
    
    func testAddBeverage() {
        myVendingMachine.addBeverage(beverage: BananaMilk(brand: "빙그레", amount: 240, price: 1000, name: "바나나맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 15, bananaContent: 3))
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 1)
        myVendingMachine.addBeverage(beverage: Cantata(brand: "롯데", amount: 500, price: 3000, name: "콘트라베이스 콜드브루", calorie: 20, saleablePeriod: 270, caffeineContent: 179, isHot: true))
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 2)
    }
}
