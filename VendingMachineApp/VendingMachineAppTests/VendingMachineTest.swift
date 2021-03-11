//
//  VendingMachineTest.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/06.
//

import XCTest

class VendingMachineTest: XCTestCase {
    
    private var vending: VendingMachine!
    
    override func setUp() {
        vending = VendingMachine()
    }

    override func tearDown() {
        
    }

    func test_500원_입금_성공() {
        vending.collectMoney(with: .coins)
        XCTAssertEqual(vending.checkBalance(), 500, "500원 입금 확인!")
    }

    func test_인벤_동작확인() {
        vending.add(item: TOP())
        XCTAssertEqual(vending.inventoryList(), [ObjectIdentifier(type(of:TOP())):1], "더하고 재고 확인 성공!")
    }
    
    func test_구매_동작확인() {
        vending.add(item: TOP())
        vending.collectMoney(with: .bills)
        vending.purchase(drink: TOP.self)
        
        XCTAssertEqual(vending.checkBalance(), 4100, "잔액 일치!")
        XCTAssertEqual(vending.availableDrink(), [], "재고 일치!")
        XCTAssertEqual(vending.purchaseHistory(), [TOP()], "구매 내역 일치!")
    }
}
