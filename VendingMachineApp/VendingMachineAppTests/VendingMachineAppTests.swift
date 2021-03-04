//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 이다훈 on 2021/03/03.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {

    func testDrinks() {
        let testChocoMilk = BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self) as! ChocoMilk
        XCTAssertTrue(testChocoMilk.isRealCholate())

        let testStrawBerryMilk = BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self) as! StrawberryMilk
        XCTAssertTrue(testStrawBerryMilk.isCochineal())
        XCTAssertFalse(testStrawBerryMilk.isWithInExpiration())

        let testCola = BeverageFactory.shared().getBeverage(DrinkType: Cola.self) as! Cola
        XCTAssertTrue(testCola.isUnsweetened())

        let testCider = BeverageFactory.shared().getBeverage(DrinkType: Cider.self) as! Cider
        XCTAssertEqual(testCider.productCalorie(), "327 kcal")
        XCTAssertEqual(testCider.packingMaterial(), Materials.steel)

        let testTOP = BeverageFactory.shared().getBeverage(DrinkType: TOP.self) as! TOP
        XCTAssertTrue(testTOP.isHot())
        XCTAssertEqual(testTOP.productCaffeine(), 123.45)

        let testCantata = BeverageFactory.shared().getBeverage(DrinkType: Cantata.self) as! Cantata
        XCTAssertEqual(testCantata.productCaffeine(), 0)
        XCTAssertEqual(testCantata.productBeans(), Beans.arabica)
    }
    
    func testVendingMachine() {
        
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
        
        XCTAssertEqual(testMachine.showStock(),
                       ["TOP 스위트 아메리카노": 1, "코카콜라제로": 1, "초코우유": 1, "칸타타 콘트라베이스": 1, "딸기우유": 1, "칠성-사이다": 1])
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
