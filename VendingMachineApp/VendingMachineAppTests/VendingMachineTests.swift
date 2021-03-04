//
//  VendingMachineTests.swift
//  VendingMachineAppTests
//
//  Created by zombietux on 2021/03/03.
//

import XCTest
@testable import VendingMachineApp

/*
 각 메소드 동작을 검증할 수 있는 테스트 함수를 작성한다.
 테스트가 가능하다면 위에 동작 규칙을 다르게 구현해도 된다.
 전체 코드를 확인할 수 있는 통합 테스트 시나리오를 가지고 동작을 확인한다.
 예를 들어서, 재고 몇 개 추가하고 잔액 얼마 추가하면 어떤 상품 구매가능, 불가능인지 확인하고 가능한 상품 구매하고, 잔액 바뀌고 재고 상태 바뀌고, 구매 상품 이력을 확인한다.
 */

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
}
