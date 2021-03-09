//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/02/26.
//

import XCTest

class VendingMachineAppTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_is_자판기_돈_투입() throws {
        let sinRamen = SinRamen()
        let vendingMachine = VendingMachine(storage: RamenStorage(item: sinRamen),
                                            dispensedList: RamenList(),
                                            moneyBox: MoneyBox(),
                                            beverageManager: RamenManager())
        
        vendingMachine.insert(money: 1000)
        XCTAssertEqual(vendingMachine.moneyLeft(), 1000)
    }
    
    func test_is_구매가능품목() throws {
        let sinRamen: Shopable = SinRamen()
        let sinRamenBlack: Shopable = SinRamenBlack()
        let vendingMachine = VendingMachine(storage: RamenStorage(item: sinRamen),
                                            dispensedList: RamenList(),
                                            moneyBox: MoneyBox(),
                                            beverageManager: RamenManager())
        vendingMachine.insert(money: 2000)
        
        vendingMachine.addStock(of: sinRamenBlack)
        
        XCTAssertEqual(vendingMachine.affordables(),
                       [ObjectIdentifier(type(of: sinRamen))])
    }
    
    func test_is_구매후_잔액() throws {
        let sinRamenBlack: Shopable = SinRamenBlack()
        let vendingMachine = VendingMachine(storage: RamenStorage(item: sinRamenBlack),
                                            dispensedList: RamenList(),
                                            moneyBox: MoneyBox(),
                                            beverageManager: RamenManager())
        vendingMachine.insert(money: 5000)
        
        vendingMachine.buy(item: sinRamenBlack)
        vendingMachine.buy(item: sinRamenBlack) //구매하지 못하고 넘어감
        
        XCTAssertEqual(vendingMachine.moneyLeft(), 2000)
    }
}
