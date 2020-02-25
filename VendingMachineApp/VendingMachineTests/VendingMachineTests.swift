//
//  VendingMachineTests.swift
//  VendingMachineTests
//
//  Created by TTOzzi on 2020/02/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

@testable import VendingMachineApp
import XCTest

class VendingMachineTests: XCTestCase {

    var myVendingMachine: VendingMachine!
    var milk: BananaMilk!
    var coffee: Cantata!
    
    override func setUp() {
        super.setUp()
        myVendingMachine = VendingMachine()
        milk = BananaMilk(brand: "빙그레", amount: 240, price: 1000, name: "바나나맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 15, bananaContent: 3)
        coffee = Cantata(brand: "롯데", amount: 500, price: 3000, name: "콘트라베이스 콜드브루", calorie: 20, saleablePeriod: 270, caffeineContent: 179, isHot: true)
    }
    
    func testPutMoney() {
        myVendingMachine.putMoney(3000)
        XCTAssertEqual(myVendingMachine.money, 3000) 
    }
    
    func testAddBeverage() {
        myVendingMachine.addBeverage(beverage: milk)
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 1)
        XCTAssertTrue(myVendingMachine.stock.beverages.contains { $0.name == "바나나맛우유" })
        myVendingMachine.addBeverage(beverage: coffee)
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 2)
        XCTAssertTrue(myVendingMachine.stock.beverages.contains { $0.name == "콘트라베이스 콜드브루" })
    }
    
    func testPurchasableList() {
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)
        myVendingMachine.money = 2000
        XCTAssertTrue(myVendingMachine.purchasableList.contains { $0.name == "바나나맛우유" })
        XCTAssertFalse(myVendingMachine.purchasableList.contains { $0.name == "콘트라베이스 콜드브루" })
        myVendingMachine.money = 3000
        XCTAssertTrue(myVendingMachine.purchasableList.contains { $0.name == "바나나맛우유" })
        XCTAssertTrue(myVendingMachine.purchasableList.contains { $0.name == "콘트라베이스 콜드브루" })
    }
    
    func testBuy() {
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)
        myVendingMachine.money = 2000
        XCTAssertNil(myVendingMachine.buy(beverageName: "콘트라베이스 콜드브루"))
        XCTAssertNil(myVendingMachine.buy(beverageName: "딸기맛우유"))
        XCTAssertEqual(myVendingMachine.buy(beverageName: "바나나맛우유")?.name, "바나나맛우유")
        XCTAssertEqual(myVendingMachine.money, 1000)
        XCTAssertFalse(myVendingMachine.stock.beverages.contains { $0.name == "바나나맛우유" })
    }
    
    func testCheckBalance() {
        myVendingMachine.money = 3000
        XCTAssertEqual(myVendingMachine.checkBalance(), 3000)
    }
    
    func testStockList() {
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)

        XCTAssertEqual(myVendingMachine.stockList[milk], 3)
        XCTAssertEqual(myVendingMachine.stockList[coffee], 1)
    }
}
