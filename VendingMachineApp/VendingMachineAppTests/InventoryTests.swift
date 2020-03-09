//
//  InventoryTests.swift
//  VendingMachineAppTests
//
//  Created by Chaewan Park on 2020/03/04.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class InventoryTests: XCTestCase {
    
    var inventory: Inventory!
    
    override func setUp() {
        inventory = Inventory()
    }
    
    func testAdd() {
        inventory.repeatForAllItems { _ in XCTAssert(false) }
        let item = StrawberryMilk()
        inventory.add(item)
        
        var inventoryItems = [Beverage]()
        inventory.repeatForAllItems { inventoryItems.append($0) }
        XCTAssertEqual(inventoryItems, [StrawberryMilk()])
    }
    
    func testTakeOutSuccess() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { inventory.add($0) }
        inventory.takeOut(Coke(), balance: 1700) { result in
            if case let .success(beverage) = result { XCTAssertEqual(beverage, Coke()) }
            else { XCTAssert(false) }
        }
    }
    
    func testTakeOutNotInStockError() {
        let items = [StrawberryMilk(), Fanta(), Top()]
        items.forEach { inventory.add($0) }
        inventory.takeOut(Coke(), balance: 9000) { result in
            if case let .fail(error) = result { XCTAssertEqual(error, Inventory.SaleError.notInStock) }
            else { XCTAssert(false) }
        }
    }
    
    func testTakeOutInsufficientBalanceError() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { inventory.add($0) }
        inventory.takeOut(Coke(), balance: 1500) { result in
            if case let .fail(error) = result { XCTAssertEqual(error, Inventory.SaleError.insufficientBalance) }
            else { XCTAssert(false) }
        }
    }
    
    func testAvailableItems() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { inventory.add($0) }
        var availableItems = [Beverage]()
        inventory.repeatForAvailableItems(with: 1200) { availableItems.append($0) }
        XCTAssertEqual(availableItems, [Fanta(), Top()])
    }
    
    func testInvalidItems() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { inventory.add($0) }
        var invalidItems = [Beverage]()
        
        let eightDays = DateComponents(day: 8)
        let eightDaysPassedFromNow = Calendar.current.date(byAdding: eightDays, to: Date())!
        inventory.repeatForInvalidItems(with: eightDaysPassedFromNow) { invalidItems.append($0) }
        XCTAssertEqual(invalidItems, [StrawberryMilk()])
    }
    
    func testHotItems() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top(temperature: 85)]
        items.forEach { inventory.add($0) }
        var hotItems = [Beverage]()
        
        inventory.repeatForHotItems(threshold: 80) { hotItems.append($0) }
        XCTAssertEqual(hotItems, [Top(temperature: 85)])
    }
    
    func testBriefStock() {
        [Coke(), Coke(), Fanta(), Top()].forEach { inventory.add($0) }
        let result = inventory.briefStock()
        XCTAssertEqual(result, ["Coke": 2, "Fanta": 1, "Top": 1])
    }
}
