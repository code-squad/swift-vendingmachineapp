//
//  VendingMachineTests.swift
//  VendingMachineAppTests
//
//  Created by zombietux on 2021/03/03.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTests: XCTestCase {
    
    let moneyManager = Money()
    let inventoryManager = Inventory()
    let purchaseHistoryManager = PurchaseHistory()
    
    func testVendingMachine() {
        assertAddInventory()
        assertIncreaseBalance()
        assertPurchasable()
        assertPurchase()
        assertPurchasedHistory()
        assertDecreaseBalance()
    }
    
    private func assertAddInventory() {
        let bananaMilkFactory = BananaMilkFactory()
        let cantatacoffeeFactory = CantataCoffeeFactory()
        let ciderFactory = CiderFactory()
        
        inventoryManager.addInventory(bananaMilkFactory.produce())
        inventoryManager.addInventory(bananaMilkFactory.produce())
        inventoryManager.addInventory(cantatacoffeeFactory.produce())
        inventoryManager.addInventory(cantatacoffeeFactory.produce())
        inventoryManager.addInventory(cantatacoffeeFactory.produce())
        inventoryManager.addInventory(ciderFactory.produce())
        
        XCTAssertEqual(inventoryManager.readInventores().count, 6)
    }
    
    private func assertIncreaseBalance() {
        moneyManager.increaseBalance(1000)
        XCTAssertEqual(moneyManager.readBalance(), 1000)
    }
    
    private func assertPurchasable() {
        let purchasable = inventoryManager.isPurchasableInventory(balance: moneyManager.readBalance())
        XCTAssertEqual(purchasable.readInventores().count, 2)
    }
    
    private func assertPurchase() {
        let vendingMachine = VendingMachine(moneyManager: moneyManager, inventoryManager: inventoryManager, purchaseHistoryManager: purchaseHistoryManager)
        let bananaMilkFactory = BananaMilkFactory()
        let bananaMilk = bananaMilkFactory.produce()
        inventoryManager.addInventory(bananaMilk)
        XCTAssertEqual(inventoryManager.readInventores().count, 7)
        
        vendingMachine.purchaseBeverage(beverage: bananaMilk)
        XCTAssertEqual(inventoryManager.readInventores().count, 6)
    }
    
    private func assertPurchasedHistory() {
        XCTAssertEqual(purchaseHistoryManager.readHistory().count, 1)
    }
    
    private func assertDecreaseBalance() {
        XCTAssertEqual(moneyManager.readBalance(), 100)
    }
    
    func testMilkDetail() {
        let bananaMilkFactory = BananaMilkFactory()
        let bananaMilk = bananaMilkFactory.produce()
        XCTAssertTrue(!bananaMilk.isExpired(now: Date()))
        XCTAssertTrue(bananaMilk.isHot(temparature: 2))
        XCTAssertTrue(!bananaMilk.isLowCalorie(calories: 60))
        XCTAssertTrue(bananaMilk.isPurchasable(balance: 1000))
    }
}
