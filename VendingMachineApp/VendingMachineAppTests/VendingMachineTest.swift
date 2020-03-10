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
                               hotState: true)!
    let dietCola = Pepsi(volume: 350, price: 2000, name: "다이어트 콜라",
                         manufacturingDateInfo: "20190928", kiloCalorie: 80)!
    let cookieCreamMilk = HersheyChocolateDrink(volume: 190, price: 1500,
                                                name: "쿠키앤크림",
                                                manufacturingDateInfo: "20191116",
                                                expirationDateInfo: "20191123")!
    
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
        let otherCookieCreamMilk = HersheyChocolateDrink(volume: 190, price: 1500,
                                                         name: "쿠키앤크림",
                                                         manufacturingDateInfo: "20191016",
                                                         expirationDateInfo: "20191023")!
        vendingMachine.add(beverage: otherCookieCreamMilk)
        vendingMachine.searchStockByKind {
            if $0.key is HersheyChocolateDrink {
                XCTAssertEqual($0.value.count, 2)
            } else if $0.key is Cantata {
                XCTAssertEqual($0.value.count, 1)
            } else if $0.key is Pepsi {
                XCTAssertEqual($0.value.count, 1)
            }
        }
    }
    
    func testSellableBeverages() {
        vendingMachine.receive(insertedMoney: 1500)
        let sellableBeverages = vendingMachine.sellableBeverages()
        XCTAssertEqual(sellableBeverages, [cookieCreamMilk:[cookieCreamMilk]])
    }
    
    func testSell() {
        vendingMachine.receive(insertedMoney: 1500)
        let buyableBeverages = vendingMachine.sellableBeverages()
        if let buyedBeverage = vendingMachine.sell(wantedBeverage: buyableBeverages.keys.first!){
            XCTAssertEqual(buyedBeverage, cookieCreamMilk)
            XCTAssertEqual(vendingMachine.currentMoney(), 0)
        }
    }
    
    func testSearchSoldBeverages() {
        vendingMachine.receive(insertedMoney: 1500)
        if let beverage =  vendingMachine.sell(wantedBeverage: cookieCreamMilk) {
            vendingMachine.searchSoldBeverages {
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
