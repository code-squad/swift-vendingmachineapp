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
        inventoryManager.addBeverage(BeverageFactory.produce(of: Banana.self)!)
        inventoryManager.addBeverage(BeverageFactory.produce(of: Banana.self)!)
        inventoryManager.addBeverage(BeverageFactory.produce(of: Banana.self)!)
        inventoryManager.addBeverage(BeverageFactory.produce(of: Cola.self)!)
        inventoryManager.addBeverage(BeverageFactory.produce(of: Cola.self)!)
        inventoryManager.addBeverage(BeverageFactory.produce(of: TOP.self)!)
        
        XCTAssertEqual(inventoryManager.readInventores().count, 3)
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
        guard let bananaMilk = BeverageFactory.produce(of: Banana.self) else { return }
        inventoryManager.addBeverage(bananaMilk)
        XCTAssertEqual(inventoryManager.readInventores().count, 3)
        
        vendingMachine.purchaseBeverage(beverage: bananaMilk)
        XCTAssertEqual(inventoryManager.readInventores().count, 3)
    }
    
    private func assertPurchasedHistory() {
        XCTAssertEqual(purchaseHistoryManager.readHistory().count, 1)
    }
    
    private func assertDecreaseBalance() {
        XCTAssertEqual(moneyManager.readBalance(), 100)
    }
    
    func testBananaMilk() {
        guard let bananaMilk = BeverageFactory.produce(of: Banana.self) else { return }
        XCTAssertTrue(!bananaMilk.isExpired(now: Date()))
        XCTAssertTrue(bananaMilk.isHot(temparature: 2))
        XCTAssertTrue(!bananaMilk.isLowCalorie(calories: 60))
        XCTAssertTrue(bananaMilk.isPurchasable(balance: 1000))
    }
    
    func testCider() {
        guard let cider = BeverageFactory.produce(of: Cider.self) else { return }
        XCTAssertTrue(!cider.isExpired(now: Date()))
        XCTAssertTrue(cider.isHot(temparature: 2))
        XCTAssertTrue(!cider.isLowCalorie(calories: 60))
        XCTAssertTrue(cider.isPurchasable(balance: 2000))
    }
}
