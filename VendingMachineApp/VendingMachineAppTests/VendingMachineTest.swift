//
//  VendingMachineTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

final class VendingMachineTest: XCTestCase {
    var vendingMachine: VendingMachine!
    let primiumLatte = Cantata(
        milkContentRate: 0.15,
        sugarContentRate: 0.05,
        celsius: 65,
        name: "프리미엄 라떼",
        volume: 175,
        price: 1500
    )
    let dietCola = Pepsi(
        package: Pepsi.Package.can,
        kiloCalorie: 80,
        name: "다이어트 콜라",
        volume: 250,
        price: 1200
    )
    
    let dietCola2 = Pepsi(
        package: Pepsi.Package.can,
        kiloCalorie: 80,
        name: "다이어트 콜라",
        volume: 250,
        price: 1200
    )
    
    let cookieCreamMilk = HersheyChocolateDrink(
        cacaoContentRate: 0.03,
        name: "쿠키앤크림",
        volume: 235,
        price: 1300
    )
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine(
            stockable: Stock(beverages: [primiumLatte, dietCola, cookieCreamMilk, dietCola2]),
            calculable: Cashier()
        )
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }
    
    func testReceive() {
        let money = 2000
        vendingMachine.receive(insertedMoney: money)
        XCTAssertEqual(vendingMachine.currentMoney(), money)
    }
    
    func testCurrentMoney() {
        XCTAssertEqual(vendingMachine.currentMoney(), Quantity.zero)
    }
    
    func testStockByKind() {
        let stockByKind = vendingMachine.stockByKind()
        XCTAssertEqual(stockByKind,
                       [primiumLatte: 1,
                        dietCola: 2,
                        cookieCreamMilk: 1])
    }
    
    func testSellableBeverages() {
        vendingMachine.receive(insertedMoney: 1500)
        let sellableBeverages = vendingMachine.sellableBeverages()
        XCTAssertEqual(sellableBeverages,
                       [dietCola: 2, primiumLatte: 1, cookieCreamMilk: 1])
    }
    
    func testSell() {
        vendingMachine.receive(insertedMoney: 1500)
        vendingMachine.sell(wantedBeverage: cookieCreamMilk)
    }
    
    func testAdd() {
        vendingMachine = VendingMachine(stockable: Stock(), calculable: Cashier())
        let otherCookieCreamMilk = HersheyChocolateDrink(
            cacaoContentRate: 0.03,
            name: "쿠키앤크림",
            volume: 235,
            price: 1300
        )
        vendingMachine.addToStock(beverage: otherCookieCreamMilk)
        vendingMachine.repeatAllBeverages { (beverage) -> (Void) in
            XCTAssertEqual(beverage, otherCookieCreamMilk)
        }
    }
    
    func testSearchSalesLog() {
        vendingMachine.receive(insertedMoney: 1500)
        let result =  vendingMachine.sell(wantedBeverage: cookieCreamMilk)
        switch result {
        case .failure(let error):
            print(error.localizedDescription)
        case .success(let beverage):
            vendingMachine.repeatSalesLog {
                XCTAssertEqual($0, beverage)
            }
        }
    }
    
    func testSearchHotCoffees() {
        vendingMachine.repeatHotCoffees {
            XCTAssertEqual($0, primiumLatte)
        }
    }
    
    func testSearchMilksPassed() {
        if let date = Date.dateFormatter.date(from: "20191201") {
            vendingMachine.repeatMilksPassed(expirationDate: date) {
                XCTAssertEqual($0, cookieCreamMilk)
            }
        }
    }
}
