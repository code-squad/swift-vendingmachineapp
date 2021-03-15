//
//  MachineUnitTest.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/03/02.
//

import XCTest

class MachineUnitTest: XCTestCase {
    var testMachine: Machine!
    var someBeverage: Beverage!
    var purchaseHistory: [Beverage]!
    
    override func setUpWithError() throws {
        testMachine = Machine()
        someBeverage = BeverageFactory.makeBeverageWithType(brand: "동아제약", price: .high, name: "박카스", packageTime: .fresh, beverageType: Beverage.self)
        purchaseHistory = []
    }

    override func tearDownWithError() throws {
        testMachine = nil
        someBeverage = nil
        purchaseHistory = nil
    }

    func test_can_initialize_machine() {
        let machine = Machine()
    }
    
    func test_customer_insert_money() {
        let customerBudget = 10_000
        testMachine.receiveMoney(amount: customerBudget)
        XCTAssertEqual(testMachine.showInsertedCashBalance(), customerBudget)
    }
    
    func test_show_purchasables() {
        testMachine.addStock(beverage: someBeverage, amount: 10)
        let purchasables = testMachine.showPurchasables(with: 999_999)
        XCTAssertEqual(purchasables.count, 1)
    }
    
    func test_show_expried() {
    }
    
    func test_purchase_beverage_successfully_with_enough_money() {
        testMachine.receiveMoney(amount: 1_000_000)
        testMachine.addStock(beverage: someBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: someBeverage)
        XCTAssertEqual(testMachine.checkSpecificTypeOfBeverage(beverage: someBeverage),9)
    }
    
    func test_fail_purchase_beverage_with_not_enough_money() {
        testMachine.receiveMoney(amount: 10)
        testMachine.addStock(beverage: someBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: someBeverage)
        XCTAssertEqual(testMachine.checkSpecificTypeOfBeverage(beverage: someBeverage), 10)
    }
    
    func test_return_change_to_customer_when_transaction_stop_button_pressed() {
        let insertedMoney = 100_000
        testMachine.receiveMoney(amount: insertedMoney)
        testMachine.addStock(beverage: someBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: someBeverage)
        let itemPrice = someBeverage.showPrice()
        XCTAssertEqual(testMachine.transactionStopButtonPressed(), insertedMoney - itemPrice)
    }
    
    func test_save_purchase_history() {
        let insertedMoney = 100_000
        testMachine.receiveMoney(amount: insertedMoney)
        testMachine.addStock(beverage: someBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: someBeverage)
        testMachine.purchaseBeverage(beverage: someBeverage)
        XCTAssertEqual(testMachine.showPurchaseHistory(), [someBeverage, someBeverage])
        _ = testMachine.transactionStopButtonPressed()
        XCTAssertEqual(testMachine.showPurchaseHistory(), [])
    }
}
