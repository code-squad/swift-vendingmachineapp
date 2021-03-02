//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 지북 on 2021/03/02.
//

import XCTest

class VendingMachineAppTests: XCTestCase {
    var vendingMachine = VendingMachine()
    
    override func setUpWithError() throws {
        vendingMachine = VendingMachine()
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func test_50원입력_남은크레딧출력() {
        vendingMachine.insertCoin(coin: .fifty)
        XCTAssertEqual(vendingMachine.nowCredit(), 50)
    }
    
    func test_50원입력_다른크레딧출력() {
        vendingMachine.insertCoin(coin: .fifty)
        XCTAssertNotEqual(vendingMachine.nowCredit(), 100)
        XCTAssertNotEqual(vendingMachine.nowCredit(), 500)
    }
    
    
    func test_딸기우유입력후구매() {
        let drink = StrawberryMilk(date: Date().date("20210220"), lowFat: false, container: .bottle, expiration: Date().date("20210310"), hot: false, calorie: 250)
        vendingMachine.append(drink)
        vendingMachine.insertCoin(coin: .fifvethousand)
        let buyDrink = vendingMachine.buy(with: drink)
        
        XCTAssertEqual(buyDrink, drink)
    }
    
    
    func test_상품구매로그() {
        let drink = StrawberryMilk(date: Date().date("20210220"), lowFat: false, container: .bottle, expiration: Date().date("20210310"), hot: false, calorie: 250)
        vendingMachine.append(drink)
        vendingMachine.insertCoin(coin: .fifvethousand)
        _ = vendingMachine.buy(with: drink)
        XCTAssertEqual(vendingMachine.showLog(), ["서울우유, 300ml, 1800원, Strawberry Milk Bottle, 20210220"])
    }

}
