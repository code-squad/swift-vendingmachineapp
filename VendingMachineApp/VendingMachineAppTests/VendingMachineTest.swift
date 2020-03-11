//
//  VendingMachineTest.swift
//  VendingMachineAppTests
//
//  Created by kimdo2297 on 2020/03/09.
//  Copyright © 2020 Jason. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTest: XCTestCase {
    
    var vendingMachine: VendingMachine!
    let primiumLatte = Cantata(volume: 275, price: 2200,
                               name: "프리미엄 라떼",
                               manufacturingDateInfo: "20200102",
                               celsius: 65,
                               milkContentRate: 0.15,
                               sugarContentRate: 0.05)!
    let dietCola = Pepsi(volume: 350, price: 2000, name: "다이어트 콜라",
                         manufacturingDateInfo: "20190928",
                         kiloCalorie: 80, package: .glass)!
    let cookieCreamMilk = HersheyChocolateDrink(volume: 190, price: 1500,
                                                name: "쿠키앤크림",
                                                manufacturingDateInfo: "20191116",
                                                expirationDateInfo: "20191123",
                                                cacaoContentRate: 0.03)!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine(stock: [primiumLatte, dietCola, cookieCreamMilk])
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
    
    func testSearchStockByKind() {
        vendingMachine.searchStockByKind {
            if $0.key == "\(type(of: cookieCreamMilk))" {
                XCTAssertEqual($0.value, cookieCreamMilk)
            } else if $0.key == "\(type(of: primiumLatte))" {
                XCTAssertEqual($0.value, primiumLatte)
            } else if $0.key == "\(type(of: dietCola))" {
                XCTAssertEqual($0.value, dietCola)
            }
        }
    }
    
    func testSearchSellableBeverages() {
        vendingMachine.receive(insertedMoney: 1500)
        vendingMachine.searchSellableBeverages {
            XCTAssertEqual($0.key, "\(type(of: cookieCreamMilk))")
            XCTAssertEqual($0.value, cookieCreamMilk)
        }
    }

    func testSell() {
        vendingMachine.receive(insertedMoney: 1500)
        vendingMachine.searchSellableBeverages {
            vendingMachine.sell(wantedBeverage: $0.value)
            XCTAssertEqual(vendingMachine.currentMoney(), 0)
        }
    }
    
    func testAdd() {
        let otherCookieCreamMilk = HersheyChocolateDrink(volume: 190, price: 1500,
                                                         name: "쿠키앤크림",
                                                         manufacturingDateInfo: "20191016",
                                                         expirationDateInfo: "20191023",
                                                         cacaoContentRate: 0.03)!
        vendingMachine.addToStock(beverage: otherCookieCreamMilk)
        vendingMachine.searchStockByKind {
            if $0.key == "\(type(of: cookieCreamMilk))" {
                XCTAssertEqual($0.value, cookieCreamMilk)
            }
        }
    }
    
    func testSearchSalesLog() {
        vendingMachine.receive(insertedMoney: 1500)
        if let beverage =  vendingMachine.sell(wantedBeverage: cookieCreamMilk) {
            vendingMachine.searchSalesLog {
                XCTAssertEqual($0, beverage)
            }
        }
    }
    
    func testSearchHotCoffees() {
        vendingMachine.searchHotCoffees {
            XCTAssertEqual($0, primiumLatte)
        }
    }
    
    func testSearchMilksPassed() {
        if let date = Date.dateFormatter.date(from: "20191201") {
            vendingMachine.searchMilksPassed(expirationDate: date) {
                XCTAssertEqual($0, cookieCreamMilk)
            }
        }
    }
    
}
