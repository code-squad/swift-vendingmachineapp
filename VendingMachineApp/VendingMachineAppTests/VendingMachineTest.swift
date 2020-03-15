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
    let primiumLatte = Cantata(cantataBuilder: Cantatas.builderPrimiumLatte175ml,
                               manufacturingDateInfo: "20200102",
                               celsius: 65)!
    let dietCola = Pepsi(pepsiBuilder: Pepsis.builderDietCola250ml,
                         manufacturingDateInfo: "20190928")!
    let cookieCreamMilk = HersheyChocolateDrink(hersheyBuilder:
                                                HersheyChocolateDrinks.builderCookieCream235ml,
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
    
    func testStockByKind() {
        let stockByKind = vendingMachine.stockByKind()
        XCTAssertEqual(stockByKind,
                       [primiumLatte.kind: 1,
                        dietCola.kind: 1,
                        cookieCreamMilk.kind: 1])
    }
    
    func testSellableBeverages() {
        vendingMachine.receive(insertedMoney: 1200)
        let sellableBeverages = vendingMachine.sellableBeverages()
        XCTAssertEqual(sellableBeverages,
                       [dietCola.kind: 1])
    }
    
    func testSell() {
        vendingMachine.receive(insertedMoney: 1500)
        vendingMachine.sell(wantedBeverage: cookieCreamMilk)
    }
    
    func testAdd() {
        vendingMachine = VendingMachine()
        let otherCookieCreamMilk = HersheyChocolateDrink(hersheyBuilder:
            HersheyChocolateDrinks.builderCookieCream235ml,
                                                         manufacturingDateInfo: "20191116",
                                                         expirationDateInfo: "20191123")!
        vendingMachine.addToStock(beverage: otherCookieCreamMilk)
        vendingMachine.searchAllBeverages { (beverage) -> (Void) in
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
