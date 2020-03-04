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
        inventory.repeatForAllItems { XCTAssert($0 === item) }
    }
    
    func testAvailableItems() {
        let items = [StrawberryMilk(), Coke(), Fanta(), Top()]
        items.forEach { inventory.add($0) }
        var availableItems = [Beverage]()
        inventory.repeatForAvailableItems(with: 1200) { availableItems.append($0) }
        XCTAssert(availableItems[0] === items[2])
        XCTAssert(availableItems[1] === items[3])
    }
}
