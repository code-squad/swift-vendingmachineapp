//
//  VendingMachineTests.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/03/05.
//

import XCTest

class VendingMachineTests: XCTestCase {
    
    var vendingMachine: VendingMachine!
    let denmarkStrawberryMilkFactory = DenmarkStrawberryMilkFactory()
    let maeilChocolateMilkFactory = MaeilChocolateMilkFactory()
    let zeroSugarCokeFactory = ZeroSugarCokeFactory()
    let georgiaMaxFactory = GeorgiaMaxFactory()
    let redBullFactory = RedBullFactory()
    
    var strawberryMilk1: Beverage!
    var strawberryMilk2: Beverage!
    var strawberryMilk3: Beverage!
    
    var chocolateMilk1: Beverage!
    var chocolateMilk2: Beverage!
    var chocolateMilk3: Beverage!
    
    var zeroSugarCoke1: Beverage!
    var zeroSugarCoke2: Beverage!
    var zeroSugarCoke3: Beverage!
    
    var georgiaMax1: Beverage!
    var georgiaMax2: Beverage!
    var georgiaMax3: Beverage!
    
    var redBull1: Beverage!
    var redBull2: Beverage!
    var redBull3: Beverage!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        vendingMachine = VendingMachine(numberOfSlots: 6)
        strawberryMilk1 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        strawberryMilk2 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210201"), expiredAfter: Date().formattedDate(from: "20210302"))
        strawberryMilk3 = denmarkStrawberryMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210218"), expiredAfter: Date().formattedDate(from: "20210228"))
        chocolateMilk1 = maeilChocolateMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        chocolateMilk2 = maeilChocolateMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210201"), expiredAfter: Date().formattedDate(from: "20210211"))
        chocolateMilk3 = maeilChocolateMilkFactory.createProduct(manufactured: Date().formattedDate(from: "20210218"), expiredAfter: Date().formattedDate(from: "20210228"))
        zeroSugarCoke1 = zeroSugarCokeFactory.createProduct(manufactured: Date().formattedDate(from: "20200101"), expiredAfter: Date().formattedDate(from: "20220101"))
        zeroSugarCoke2 = zeroSugarCokeFactory.createProduct(manufactured: Date().formattedDate(from: "20190101"), expiredAfter: Date().formattedDate(from: "20210101"))
        zeroSugarCoke3 = zeroSugarCokeFactory.createProduct(manufactured: Date().formattedDate(from: "20190301"), expiredAfter: Date().formattedDate(from: "20210301"))
        georgiaMax1 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200101"), expiredAfter: Date().formattedDate(from: "20210101"))
        georgiaMax2 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200601"), expiredAfter: Date().formattedDate(from: "20210601"))
        georgiaMax3 = georgiaMaxFactory.createProduct(manufactured: Date().formattedDate(from: "20200301"), expiredAfter: Date().formattedDate(from: "20210301"))
        redBull1 = redBullFactory.createProduct(manufactured: Date().formattedDate(from: "20200101"), expiredAfter: Date().formattedDate(from: "20210101"))
        redBull2 = redBullFactory.createProduct(manufactured: Date().formattedDate(from: "20200601"), expiredAfter: Date().formattedDate(from: "20200601"))
        redBull3 = redBullFactory.createProduct(manufactured: Date().formattedDate(from: "20200301"), expiredAfter: Date().formattedDate(from: "20210301"))
        
        vendingMachine.add(item: strawberryMilk1, slotNumber: 1)
        vendingMachine.add(item: strawberryMilk2, slotNumber: 1)
        vendingMachine.add(item: strawberryMilk3, slotNumber: 1)
        vendingMachine.add(item: chocolateMilk1, slotNumber: 2)
        vendingMachine.add(item: chocolateMilk2, slotNumber: 2)
        vendingMachine.add(item: chocolateMilk3, slotNumber: 2)
        vendingMachine.add(item: zeroSugarCoke1, slotNumber: 3)
        vendingMachine.add(item: zeroSugarCoke2, slotNumber: 3)
        vendingMachine.add(item: zeroSugarCoke3, slotNumber: 3)
        vendingMachine.add(item: georgiaMax1, slotNumber: 4)
        vendingMachine.add(item: georgiaMax2, slotNumber: 4)
        vendingMachine.add(item: georgiaMax3, slotNumber: 4)
        vendingMachine.add(item: redBull1, slotNumber: 5)
        vendingMachine.add(item: redBull2, slotNumber: 5)
        vendingMachine.add(item: redBull3, slotNumber: 5)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        vendingMachine = nil
        strawberryMilk1 = nil
        strawberryMilk2 = nil
        strawberryMilk3 = nil
        chocolateMilk1 = nil
        chocolateMilk2 = nil
        chocolateMilk3 = nil
        zeroSugarCoke1 = nil
        zeroSugarCoke2 = nil
        zeroSugarCoke3 = nil
        georgiaMax1 = nil
        georgiaMax2 = nil
        georgiaMax3 = nil
        redBull1 = nil
        redBull2 = nil
        redBull3 = nil
    }
    
    func test_자판기앱_자판기_돈넣기() throws {
        vendingMachine.insertMoney(amount: 1000)
        XCTAssertEqual(vendingMachine.showBalance(), 1000)
    }
    
    func test_자판기앱_1000원으로_구매가능상품() throws {
        vendingMachine.insertMoney(amount: 1000)
        XCTAssertEqual(vendingMachine.showPurchasableItemsWithDeposit().count, 4)
    }
    
    func test_자판기앱_800원으로_구매가능상품() throws {
        vendingMachine.insertMoney(amount: 800)
        XCTAssertEqual(vendingMachine.showPurchasableItemsWithDeposit().count, 1)
    }
    
    func test_자판기앱_2000원으로_구매가능상품() throws {
        vendingMachine.insertMoney(amount: 2000)
        XCTAssertEqual(vendingMachine.showPurchasableItemsWithDeposit().count, 5)
    }
    
    func test_자판기앱_빈슬롯에_상품추가() throws {
        vendingMachine.add(item: strawberryMilk1, slotNumber: 6)
        if let slot6 = vendingMachine.takeInventory()[6] {
            XCTAssertEqual(slot6.1, 1)
        }
    }
    
    func test_자판기앱_슬롯에_같은상품추가() throws {
        vendingMachine.add(item: strawberryMilk1, slotNumber: 1)
        if let slot1 = vendingMachine.takeInventory()[1] {
            XCTAssertEqual(slot1.1, 4)
        }
    }
    
    func test_자판기앱_슬롯에_다른상품추가() throws {
        vendingMachine.add(item: strawberryMilk1, slotNumber: 2)
        if let slot2 = vendingMachine.takeInventory()[2] {
            XCTAssertNotEqual(slot2.1, 4)
            XCTAssertEqual(slot2.1, 3)
        }
    }
    
    func test_자판기앱_상품구매() throws {
        vendingMachine.insertMoney(amount: 2000)
        if let vendedItem = vendingMachine.vend(itemNamed: "레드불 에너지 드링크") {
            XCTAssertEqual(ObjectIdentifier(type(of: vendedItem)), ObjectIdentifier(EnergyDrink.self))
        }
    }
    
    func test_자판기앱_유통기한지난상품() throws {
        XCTAssertEqual(vendingMachine.showExpiredItems().count, 13)
    }
    
    func test_자판기앱_따듯한음료() throws {
        XCTAssertEqual(vendingMachine.showHotDrinks().count, 1)
    }
    
    func test_자판기앱_판매이력() throws {
        let _ = vendingMachine.vend(itemNamed: "덴마크 딸기딸기 우유")
        let _ = vendingMachine.vend(itemNamed: "코카콜라 제로")
        let _ = vendingMachine.vend(itemNamed: "레드불 에너지 드링크")
        let _ = vendingMachine.vend(itemNamed: "레드불 에너지 드링크")
        let _ = vendingMachine.vend(itemNamed: "조지아 맥스")
        let _ = vendingMachine.vend(itemNamed: "덴마크 딸기딸기 우유")
        let _ = vendingMachine.vend(itemNamed: "소화가 잘되는 우유 초콜릿")
        XCTAssertEqual(vendingMachine.showPurchaseHistory().orderCount, 7)
    }
    
    func test_자판기앱_상품재고리턴() throws {
        let inventorySheet = vendingMachine.takeInventory()
        XCTAssertEqual(inventorySheet[1]?.1, 3)
        XCTAssertEqual(inventorySheet[2]?.1, 3)
        XCTAssertEqual(inventorySheet[3]?.1, 3)
        XCTAssertEqual(inventorySheet[4]?.1, 3)
        XCTAssertEqual(inventorySheet[5]?.1, 3)
        XCTAssertEqual(inventorySheet[6]?.1, 0)
    }
}
