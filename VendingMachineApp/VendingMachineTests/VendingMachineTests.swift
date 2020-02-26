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
        milk = BananaMilk(brand: "빙그레", amount: 240, price: Money(amount: 1000), name: "바나나맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 15, bananaContent: 3)
        coffee = Cantata(brand: "롯데", amount: 500, price: Money(amount: 3000), name: "콘트라베이스 콜드브루", calorie: 20, saleablePeriod: 270, caffeineContent: 179, isHot: true)
    }
    
    func testPutMoney() {
        myVendingMachine.putMoney(Money(amount: 3000))
        XCTAssertEqual(myVendingMachine.money, Money(amount: 3000))
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
        myVendingMachine.money = Money(amount: 2000)
        XCTAssertTrue(myVendingMachine.purchasableList.contains { $0.name == "바나나맛우유" })
        XCTAssertFalse(myVendingMachine.purchasableList.contains { $0.name == "콘트라베이스 콜드브루" })
        myVendingMachine.money = Money(amount: 3000)
        XCTAssertTrue(myVendingMachine.purchasableList.contains { $0.name == "바나나맛우유" })
        XCTAssertTrue(myVendingMachine.purchasableList.contains { $0.name == "콘트라베이스 콜드브루" })
    }
    
    func testBuy() {
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)
        myVendingMachine.money = Money(amount: 2000)
        XCTAssertNil(myVendingMachine.buy(beverage: coffee))
        XCTAssertEqual(myVendingMachine.buy(beverage: milk), milk)
        XCTAssertEqual(myVendingMachine.money, Money(amount: 1000))
        XCTAssertFalse(myVendingMachine.stock.beverages.contains(milk))
    }
    
    func testCheckBalance() {
        myVendingMachine.money = Money(amount: 3000)
        XCTAssertEqual(myVendingMachine.checkBalance(), Money(amount: 3000))
    }
    
    func testStockList() {
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)

        XCTAssertEqual(myVendingMachine.stockList[milk], 3)
        XCTAssertEqual(myVendingMachine.stockList[coffee], 1)
    }
    
    func testDateExpiredBeverages() {
        let expiredCola = Cola(brand: "코카콜라", amount: 500, price: Money(amount: 2000), name: "콜라", calorie: 30, saleablePeriod: -1, sugarContent: 0)
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)
        myVendingMachine.stock.beverages.append(expiredCola)
        XCTAssertEqual(myVendingMachine.dateExpiredBeverages.count, 1)
        XCTAssertTrue(myVendingMachine.dateExpiredBeverages.contains(expiredCola))
    }
    
    func testHotBeverages() {
        myVendingMachine.stock.beverages.append(milk)
        myVendingMachine.stock.beverages.append(coffee)
        XCTAssertEqual(myVendingMachine.hotBeverages.count, 1)
        XCTAssertTrue(myVendingMachine.hotBeverages.contains(coffee))
    }
}
