//
//  SlotTests.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/03/04.
//

import XCTest

class SlotTests: XCTestCase {
    let denmarkStrawberryMilkFactory = DenmarkStrawberryMilkFactory()
    let georgiaMaxFactory = GeorgiaMaxFactory()
    var strawberryMilk1: Beverage!
    var strawberryMilk2: Beverage!
    var strawberryMilk3: Beverage!
    var georgiaMax1: Beverage!
    var georgiaMax2: Beverage!
    var georgiaMax3: Beverage!
    var emptySlot: Slot!
    var slotWith3StrawberryMilk: Slot!
    var slotWith3GeorgiaMax: Slot!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        strawberryMilk1 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210302"), expiredAfter: Date().formattedDate(from: "20210312"))
        strawberryMilk2 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210201"), expiredAfter: Date().formattedDate(from: "20210210"))
        strawberryMilk3 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210218"), expiredAfter: Date().formattedDate(from: "20210228"))
        georgiaMax1 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200101"), expiredAfter: Date().formattedDate(from: "20210101"))
        georgiaMax2 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200601"), expiredAfter: Date().formattedDate(from: "20210601"))
        georgiaMax3 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200301"), expiredAfter: Date().formattedDate(from: "20210301"))
        emptySlot = Slot()
        slotWith3StrawberryMilk = Slot(items: [strawberryMilk1, strawberryMilk2, strawberryMilk3])
        slotWith3GeorgiaMax = Slot(items: [georgiaMax1, georgiaMax2, georgiaMax3])
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        strawberryMilk1 = nil
        strawberryMilk2 = nil
        strawberryMilk3 = nil
        georgiaMax1 = nil
        georgiaMax2 = nil
        georgiaMax3 = nil
        emptySlot = nil
        slotWith3StrawberryMilk = nil
        slotWith3GeorgiaMax = nil
    }
    
    func test_자판기앱_빈슬롯생성() throws {
        XCTAssertEqual(emptySlot.itemCount, 0)
        XCTAssertNil(emptySlot.dropFirstItem())
    }
    
    func test_자판기앱_아이템3개_슬롯생성() throws {
        XCTAssertEqual(slotWith3StrawberryMilk.itemCount, 3)
        XCTAssertEqual(slotWith3StrawberryMilk.dropFirstItem(), strawberryMilk1)
    }
    
    func test_자판기앱_빈슬롯에_아이템추가() throws {
        emptySlot.stock(strawberryMilk1)
        XCTAssertEqual(emptySlot.itemCount, 1)
        XCTAssertEqual(emptySlot.dropFirstItem(), strawberryMilk1)
    }
    
    func test_자판기앱_아이템들어있는슬롯에_같은아이템추가() throws {
        let strawberryMilk4 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210218"), expiredAfter: Date().formattedDate(from: "20210228"))
        slotWith3StrawberryMilk.stock(strawberryMilk4)
        XCTAssertEqual(slotWith3StrawberryMilk.itemCount, 4)
    }
    
    func test_자판기앱_아이템들어있는슬롯에_다른아이템추가() throws {
        slotWith3StrawberryMilk.stock(georgiaMax1)
        XCTAssertEqual(slotWith3StrawberryMilk.itemCount, 3)
    }
    
    func test_자판기앱_슬롯음료가격_매개변수가격과_비교() throws {
        XCTAssertTrue(slotWith3StrawberryMilk.isSameOrCheaper(than: 1500))
        XCTAssertTrue(slotWith3StrawberryMilk.isSameOrCheaper(than: 1000))
        XCTAssertFalse(slotWith3StrawberryMilk.isSameOrCheaper(than: 900))
    }
    
    func test_자판기앱_슬롯음료이름_매개변수이름과_비교() throws {
        XCTAssertTrue(slotWith3StrawberryMilk.compareName(with: "덴마크 딸기딸기 우유"))
        XCTAssertFalse(slotWith3StrawberryMilk.compareName(with: "조지아 맥스"))
    }
    
    func test_자판기앱_빈슬롯에서_첫번째아이템_꺼내기() throws {
        XCTAssertNil(emptySlot.dropFirstItem())
    }
    
    func test_자판기앱_아이템들어있는슬롯에서_첫번째아이템_꺼내기() throws {
        XCTAssertEqual(slotWith3StrawberryMilk.dropFirstItem(), strawberryMilk1)
    }
    
    func test_자판기앱_빈슬롯에서_유통기한지난아이템() throws {
        XCTAssertEqual(emptySlot.getExpiredItems(), [])
    }
    
    func test_자판기앱_아이템들어있는슬롯에서_유통기한지난아이템() throws {
        XCTAssertEqual(slotWith3StrawberryMilk.getExpiredItems(), [strawberryMilk2, strawberryMilk3])
    }
    
    func test_자판기앱_빈슬롯_따듯한음료슬롯인지_판별() {
        XCTAssertFalse(emptySlot.isHotDrinkSlot())
    }
    
    func test_자판기앱_찬음료슬롯_따듯한음료슬롯인지_판별() {
        XCTAssertFalse(slotWith3StrawberryMilk.isHotDrinkSlot())
    }
    
    func test_자판기앱_따듯한음료슬롯_따듯한음료슬롯인지_판별() {
        XCTAssertTrue(slotWith3GeorgiaMax.isHotDrinkSlot())
    }
}
