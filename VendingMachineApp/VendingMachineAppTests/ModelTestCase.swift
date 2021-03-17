//
//  ModelTestCase.swift
//  VendingMachineAppTests
//
//  Created by 이다훈 on 2021/03/17.
//

import XCTest
//@testable import VendingMachineApp

class ModelTestCase: XCTestCase {
    
    func testChocoMilkModel() {
        let testChocoMilk = BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self) as! ChocoMilk
        XCTAssertTrue(testChocoMilk.isRealCholate())
    }
    
    func testStrawBerryMilkModel() {
        let testStrawBerryMilk = BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self) as! StrawberryMilk
        XCTAssertTrue(testStrawBerryMilk.isCochineal())
        XCTAssertFalse(testStrawBerryMilk.isWithInExpiration())
    }
        
    
    func testTOPCoffeeModel() {
        let testTOP = BeverageFactory.shared().getBeverage(DrinkType: TOP.self) as! TOP
        XCTAssertTrue(testTOP.isHot())
        XCTAssertEqual(testTOP.productCaffeine(), 123.45)
    }
    
    func testCantataCoffeeModel() {
        let testCantata = BeverageFactory.shared().getBeverage(DrinkType: Cantata.self) as! Cantata
        XCTAssertEqual(testCantata.productCaffeine(), 0)
        XCTAssertEqual(testCantata.productBeans(), Beans.arabica)
    }
    
    func testColaSodaModel() {
        let testCola = BeverageFactory.shared().getBeverage(DrinkType: Cola.self) as! Cola
        XCTAssertTrue(testCola.isUnsweetened())
    }
    
    func testCiderSodaModel() {
        let testCider = BeverageFactory.shared().getBeverage(DrinkType: Cider.self) as! Cider
        XCTAssertEqual(testCider.productCalorie(), "327 kcal")
        XCTAssertEqual(testCider.packingMaterial(), Materials.steel)
    }
}
