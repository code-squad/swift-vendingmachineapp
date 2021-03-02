//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Issac on 2021/02/27.
//

import XCTest
//@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    var stock: StockDrink!
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        stock = StockDrink()
        vendingMachine = VendingMachine(stock: stock)
    }
    
    override func tearDown() {
        stock = nil
        vendingMachine = nil
        super.tearDown()
    }
    
    // 통합 테스트 시나리오
    func testVendingMachineScenario() {
        let blueBottle = DrinkFactory.makeDrink(of: .blueBottleColdBrew)
        let starbucks = DrinkFactory.makeDrink(of: .starBucksColdBrew)
        let seoulMilk = DrinkFactory.makeDrink(of: .seoulStrawberryMilk)
        let bananaMilk = DrinkFactory.makeDrink(of: .bingBananaMilk)
        let sanpellegrino = DrinkFactory.makeDrink(of: .sanpellegrino)
        let fanta = DrinkFactory.makeDrink(of: .fanta, manufactured: Date() - 365)
        
        // Productization을 채택하지 않은 Soda 클래스
        let weirdSoda = Soda(brand: "탄산회사", capacity: 500, price: 1500, name: "정체모를 탄산수", isZeroCalorie: true, manufactured: Date())
        
        vendingMachine.addDrink(blueBottle)
        vendingMachine.addDrink(starbucks)
        vendingMachine.addDrink(seoulMilk)
        vendingMachine.addDrink(bananaMilk)
        vendingMachine.addDrink(sanpellegrino)
        vendingMachine.addDrink(fanta)
        vendingMachine.addDrink(weirdSoda)
        
        XCTAssertEqual(vendingMachine.showStock(),
                       [blueBottle: 1, starbucks: 1, seoulMilk: 1, bananaMilk: 1, sanpellegrino: 1, fanta: 1])
        
        XCTAssertEqual(vendingMachine.findWarmDrinks(), [])
        
        XCTAssertEqual(vendingMachine.findExpiredDrinks(), [fanta])
        
        vendingMachine.insertCoin(1000)
        
        XCTAssertEqual(vendingMachine.availableDrink(), [seoulMilk])
        _ = vendingMachine.buy(seoulMilk)
        XCTAssertEqual(vendingMachine.showPurchasehistory(), [seoulMilk])
        
    }
}
