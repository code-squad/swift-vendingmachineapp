//
//  InventoryTests.swift
//  InventoryTests
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
        inventory.append(with: drink)
        
        XCTAssertNotEqual(inventory, Inventory(), "Inventory 생성 및 append 성공")
    }
    
    func test_Inventory_삭제() {
        inventory.append(with: drink)
        inventory.remove(item: drink)
        
        XCTAssertEqual(inventory, Inventory(), "Inventory 삭제 성공")
    }

    func test_재고목록_리턴() {
        inventory.append(with: drink)
        inventory.append(with: drink)
        
        XCTAssertEqual(inventory.getStockList(), [TOP():2], "재고목록 리턴 성공")
    }
    
    func test_유통기한_지난_재고() {
        inventory.append(with: drink)
        inventory.append(with: drink)
        
        XCTAssertEqual(inventory.expiredItems(), [TOP(), TOP()], "유통기한 지난 재고 리턴 성공")
    }
    
    func test_카페인_함량() {
        inventory.append(with: drink)
        
        XCTAssertEqual(inventory.lowCaffeineItems(), [TOP()], "유통기한 지난 재고 리턴 성공")
    }
    
    func test_낮은가격목록_성공() {
        inventory.append(with: drink)
        inventory.append(with: drink)
        
        XCTAssertEqual(inventory.cheapItems(with: 1000), [TOP(), TOP()], "구매 가능 목록 리턴 성공")
    }
    
    func test_낮은가격목록_실패() {
        inventory.append(with: drink)
        inventory.append(with: drink)
        
        XCTAssertEqual(inventory.cheapItems(with: 800), [], "구매 가능 목록 리턴 실패")
    }
}
