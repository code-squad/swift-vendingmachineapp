//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 이다훈 on 2021/03/03.
//

import XCTest
//@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    
    func testScenarioVendingMachine() {
        
        var testMachine = VendingMachine()
        XCTAssertEqual(testMachine.checkMoney(), 0)
        
        testMachine.insertMoney(howMuch: 1000)
        XCTAssertEqual(testMachine.checkMoney(), 1000)
        
        testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self))
        testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self))
        testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cola.self))
        testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cider.self))
        testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: TOP.self))
        testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cantata.self))
        
        XCTAssertEqual(testMachine.hotDrinks(), ["TOP 스위트 아메리카노"])
        let testChocoMilk = BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self) as! ChocoMilk
        let testStrawBerryMilk = BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self) as! StrawberryMilk
        XCTAssertEqual(testMachine.expiredStock(),
                       [testChocoMilk, testStrawBerryMilk])
        XCTAssertEqual(testMachine.availableList(),
                       ["딸기우유", "코카콜라제로", "칠성-사이다", "초코우유", "TOP 스위트 아메리카노"])
        testMachine.buyProduct(what: StrawberryMilk.self)
        XCTAssertEqual(testMachine.purchasedList(), ["딸기우유"])
        XCTAssertEqual(testMachine.checkMoney(), 160)
    }
}
