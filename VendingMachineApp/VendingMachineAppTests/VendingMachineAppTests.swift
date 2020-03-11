//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    
    public var vendingMachine: VendingMachine!
    public var cola: Cola!
    
    override func setUp() {
        vendingMachine = VendingMachine()
        cola = Cola(brand: "코카콜라", weight: 132, price: 1500, name: "다이어트", dateOfManufacture: Date().addingTimeInterval(500), temperature: 12.00, calorie: 213, concentration: 34.00, sugar: false)
        vendingMachine.add(product: cola, amount: 3)
    }
    
    func testInsertCoin() {
        vendingMachine.insert(coin: 300)
        XCTAssertTrue(vendingMachine.balance)
    }
    
    func testAddProduct() {
        XCTAssertEqual(vendingMachine.productsCount, 1)
    }
    
    func testCostValidProduct() {
        XCTAssertEqual(vendingMachine.costValidProducts().count, 0)
    }
    
    func testBuyProduct() {
        vendingMachine.buy(product: cola)
        XCTAssertEqual(vendingMachine.ordered.count, 1)
    }
    
    func testInvalidDateProducts() {
        XCTAssertEqual(vendingMachine.inValidDateProducts(date: Date().addingTimeInterval(600)).count, 1)
    }
    
    func testHotProducts() {
        XCTAssertEqual(vendingMachine.hotProducts().count, 1)
    }
}
