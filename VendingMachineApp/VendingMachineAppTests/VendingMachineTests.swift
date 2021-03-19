//
//  VendingMachineTests.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/03/05.
//

import XCTest

class VendingMachineTests: XCTestCase {
    
    var vendingMachine: VendingMachine!
    var emptyVendingMachine: VendingMachine!
    let denmarkStrawberryMilkFactory = DenmarkStrawberryMilkFactory()
    let maeilChocolateMilkFactory = MaeilChocolateMilkFactory()
    let zeroSugarCokeFactory = ZeroSugarCokeFactory()
    let georgiaMaxFactory = GeorgiaMaxFactory()
    let redBullFactory = RedBullFactory()
    
    var strawberryMilk1: Product!
    var strawberryMilk2: Product!
    var strawberryMilk3: Product!
    
    var chocolateMilk1: Product!
    var chocolateMilk2: Product!
    var chocolateMilk3: Product!
    
    var zeroSugarCoke1: Product!
    var zeroSugarCoke2: Product!
    var zeroSugarCoke3: Product!
    
    var georgiaMax1: Product!
    var georgiaMax2: Product!
    var georgiaMax3: Product!
    
    var redBull1: Product!
    var redBull2: Product!
    var redBull3: Product!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        vendingMachine = VendingMachine(numberOfSlots: 6)
        emptyVendingMachine = VendingMachine(numberOfSlots: 6)
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
        
        vendingMachine.add(item: strawberryMilk1)
        vendingMachine.add(item: strawberryMilk2)
        vendingMachine.add(item: strawberryMilk3)
        vendingMachine.add(item: chocolateMilk1)
        vendingMachine.add(item: chocolateMilk2)
        vendingMachine.add(item: chocolateMilk3)
        vendingMachine.add(item: zeroSugarCoke1)
        vendingMachine.add(item: zeroSugarCoke2)
        vendingMachine.add(item: zeroSugarCoke3)
        vendingMachine.add(item: georgiaMax1)
        vendingMachine.add(item: georgiaMax2)
        vendingMachine.add(item: georgiaMax3)
        vendingMachine.add(item: redBull1)
        vendingMachine.add(item: redBull2)
        vendingMachine.add(item: redBull3)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        vendingMachine = nil
        emptyVendingMachine = nil
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
    
    func test_자판기앱_빈자판기에_상품추가() throws {
        emptyVendingMachine.add(item: strawberryMilk1)
        let inventorySheet = emptyVendingMachine.takeInventory()
        XCTAssertEqual(inventorySheet, [Slot(items: [strawberryMilk1]): 1])
    }
    
    func test_자판기앱_제품있는자판기에_상품추가() throws {
        vendingMachine.add(item: strawberryMilk1)
        let inventorySheet = vendingMachine.takeInventory()
        XCTAssertEqual(inventorySheet, [Slot(items: [strawberryMilk1, strawberryMilk2, strawberryMilk3, strawberryMilk1]): 4,
                                        Slot(items: [chocolateMilk1, chocolateMilk2, chocolateMilk3]): 3,
                                        Slot(items: [zeroSugarCoke1, zeroSugarCoke2, zeroSugarCoke3]): 3,
                                        Slot(items: [georgiaMax1, georgiaMax2, georgiaMax3]): 3,
                                        Slot(items: [redBull1, redBull2, redBull3]): 3])
    }
    
    func test_자판기앱_상품구매() throws {
        vendingMachine.insertMoney(amount: 2000)
        if let vendedItem = vendingMachine.vend(from: Slot(items: [redBull1])) {
            XCTAssertEqual(ObjectIdentifier(type(of: vendedItem)), ObjectIdentifier(EnergyDrink.self))
        }
    }
    
    func test_자판기앱_유통기한지난상품() throws {
        XCTAssertEqual(vendingMachine.showExpiredItems(at: Date()).count, 13)
    }
    
    func test_자판기앱_따듯한음료() throws {
        XCTAssertEqual(vendingMachine.showHotDrinks().count, 1)
    }
    
    func test_자판기앱_판매이력() throws {
        vendingMachine.showInventorySheet {
            let _ = vendingMachine.vend(from: $0.key)
        }
        XCTAssertEqual(vendingMachine.showPurchaseHistory().orderCount, 5)
    }
    
    func test_자판기앱_상품재고리턴() throws {
        let inventorySheet = vendingMachine.takeInventory()
        XCTAssertEqual(inventorySheet, [Slot(items: [strawberryMilk1, strawberryMilk2, strawberryMilk3]): 3,
                                        Slot(items: [chocolateMilk1, chocolateMilk2, chocolateMilk3]): 3,
                                        Slot(items: [zeroSugarCoke1, zeroSugarCoke2, zeroSugarCoke3]): 3,
                                        Slot(items: [georgiaMax1, georgiaMax2, georgiaMax3]): 3,
                                        Slot(items: [redBull1, redBull2, redBull3]): 3])
    }
}
