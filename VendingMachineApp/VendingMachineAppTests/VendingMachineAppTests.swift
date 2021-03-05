//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Lia on 2021/03/04.
//

import XCTest

class InventoryTests: XCTestCase {
    
    private var inventory: Inventory!
    private var drink: Beverage!
    
    override func setUp() {
        inventory = Inventory()
        drink = TOP()
    }

    override func tearDown() {
        
    }

    func test_Inventory_생성_및_append() {
        inventory.append(item: drink)
        
        XCTAssertNotEqual(inventory, Inventory(), "Inventory 생성 및 append 성공")
    }
    
    func test_Inventory_삭제() {
        inventory.append(item: drink)
        inventory.remove(item: drink)
        
        XCTAssertEqual(inventory, Inventory(), "Inventory 삭제 성공")
    }

}
