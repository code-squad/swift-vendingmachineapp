//
//  InventoryTests.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/03/04.
//

import XCTest

class InventoryTests: XCTestCase {
    let denmarkStrawberryMilkFactory = DenmarkStrawberryMilkFactory()
    let georgiaMaxFactory = GeorgiaMaxFactory()
    var strawberryMilk1: Beverage!
    var strawberryMilk2: Beverage!
    var strawberryMilk3: Beverage!
    var georgiaMax1: Beverage!
    var georgiaMax2: Beverage!
    var georgiaMax3: Beverage!
    var emptyInventory1: Inventory!
    var emptyInventory2: Inventory!
    var inventoryWith6EmptySlots: Inventory!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        strawberryMilk1 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210226"), expiredAfter: Date().formattedDate(from: "20210306"))
        strawberryMilk2 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210201"), expiredAfter: Date().formattedDate(from: "20210301"))
        strawberryMilk3 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210218"), expiredAfter: Date().formattedDate(from: "20210228"))
        georgiaMax1 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200101"), expiredAfter: Date().formattedDate(from: "20210101"))
        georgiaMax2 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200601"), expiredAfter: Date().formattedDate(from: "20210601"))
        georgiaMax3 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200301"), expiredAfter: Date().formattedDate(from: "20210301"))
        emptyInventory1 = Inventory(slots: [])
        emptyInventory2 = Inventory(numberOfSlots: 0)
        inventoryWith6EmptySlots = Inventory(numberOfSlots: 6)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        strawberryMilk1 = nil
        strawberryMilk2 = nil
        strawberryMilk3 = nil
        georgiaMax1 = nil
        georgiaMax2 = nil
        georgiaMax3 = nil
        emptyInventory1 = nil
        emptyInventory2 = nil
        inventoryWith6EmptySlots = nil
    }

    func test_자판기앱_빈인벤토리생성() throws {
        XCTAssertEqual(emptyInventory1.slotCount, 0)
        XCTAssertEqual(emptyInventory2.slotCount, 0)
    }
    
    func test_자판기앱_빈슬롯6개_인벤토리생성() throws {
        XCTAssertEqual(inventoryWith6EmptySlots.slotCount, 6)
    }
    
    func test_자판기앱_0번슬롯에_아이템추가() throws {
        inventoryWith6EmptySlots.add(strawberryMilk1, at: 0)
        var totalItemCount = 0
        inventoryWith6EmptySlots.showSlots {
            totalItemCount += $0.itemCount
        }
        XCTAssertEqual(totalItemCount, 0)
    }
    
    func test_자판기앱_1번슬롯에_아이템추가() throws {
        inventoryWith6EmptySlots.add(strawberryMilk1, at: 1)
        var totalItemCount = 0
        inventoryWith6EmptySlots.showSlots {
            totalItemCount += $0.itemCount
        }
        XCTAssertEqual(totalItemCount, 1)
    }
    
    func test_자판기앱_6번슬롯에_아이템추가() throws {
        inventoryWith6EmptySlots.add(strawberryMilk1, at: 6)
        var totalItemCount = 0
        inventoryWith6EmptySlots.showSlots {
            totalItemCount += $0.itemCount
        }
        XCTAssertEqual(totalItemCount, 1)
    }
    
    func test_자판기앱_7번슬롯에_아이템추가() throws {
        inventoryWith6EmptySlots.add(strawberryMilk1, at: 7)
        var totalItemCount = 0
        inventoryWith6EmptySlots.showSlots {
            totalItemCount += $0.itemCount
        }
        XCTAssertEqual(totalItemCount, 0)
    }
    
    func test_자판기앱_상품재고리턴() throws {
        inventoryWith6EmptySlots.add(strawberryMilk1, at: 1)
        inventoryWith6EmptySlots.add(strawberryMilk2, at: 1)
        inventoryWith6EmptySlots.add(strawberryMilk3, at: 1)
        inventoryWith6EmptySlots.add(georgiaMax1, at: 2)
        inventoryWith6EmptySlots.add(georgiaMax2, at: 2)
        inventoryWith6EmptySlots.add(georgiaMax3, at: 2)
        let inventorySheet = inventoryWith6EmptySlots.takeStock()
        XCTAssertEqual(inventorySheet[1]?.1, 3)
        XCTAssertEqual(inventorySheet[2]?.1, 3)
        XCTAssertEqual(inventorySheet[3]?.1, 0)
        XCTAssertEqual(inventorySheet[4]?.1, 0)
        XCTAssertEqual(inventorySheet[5]?.1, 0)
        XCTAssertEqual(inventorySheet[6]?.1, 0)
    }
}
