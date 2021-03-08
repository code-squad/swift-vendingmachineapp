//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Issac on 2021/02/27.
//

import XCTest
//@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    var stock: StockManageable!
    var coinCounter: CoinCounter!
    var vendingMachine: VendingMachine!
    var fanta: Fanta!
    var seoulMilk: SeoulStrawberryMilk!
    
    override func setUp() {
        super.setUp()
        stock = Stock()
        coinCounter = CoinCounter()
        vendingMachine = VendingMachine()
        guard let blueBottle = DrinkFactory.makeDrink(of: BlueBottleColdBrew.self) else { return }
        guard let starbucks = DrinkFactory.makeDrink(of: StarbucksColdBrew.self) else { return }
        guard case self.seoulMilk = DrinkFactory.makeDrink(of: SeoulStrawberryMilk.self) else { return }
        guard let bananaMilk = DrinkFactory.makeDrink(of: BingBananaMilk.self) else { return }
        guard let sanpellegrino = DrinkFactory.makeDrink(of: Sanpellegrino.self) else { return }
        guard case self.fanta = DrinkFactory.makeDrink(of: Fanta.self, manufactured: Date() - 365) else { return }
        
        // Productization을 채택하지 않은 Soda 클래스
        let weirdSoda = Soda(brand: "탄산회사", capacity: 500, price: 1500, name: "정체모를 탄산수", isZeroCalorie: true, manufactured: Date(), temperature: 15, calorie: 150)
        
        vendingMachine.addDrink(blueBottle)
        vendingMachine.addDrink(starbucks)
        vendingMachine.addDrink(seoulMilk)
        vendingMachine.addDrink(bananaMilk)
        vendingMachine.addDrink(sanpellegrino)
        vendingMachine.addDrink(fanta)
        vendingMachine.addDrink(weirdSoda)
    }
    
    override func tearDown() {
        stock = nil
        vendingMachine = nil
        coinCounter = nil
        seoulMilk = nil
        fanta = nil
        super.tearDown()
    }
    
    func 보관중인_Drink_갯수() {
        XCTAssertEqual(vendingMachine.showStock().count, 6)
    }
    
    func 창고안에서_따듯한_Drink_반환() {
        XCTAssertEqual(vendingMachine.findWarmDrinks(), [])
    }
    
    func 유통기한_지난_Drink_반환() {
        XCTAssertEqual(vendingMachine.findExpiredDrinks(), [fanta])
    }
    
    func 동전_투입_후_이용가능한_Drink_반환() {
        vendingMachine.insertCoin(1000)
        XCTAssertEqual(vendingMachine.availableDrink(), [seoulMilk])
    }
    
    func 구입_후_구매이력_반환() {
        _ = vendingMachine.buy(typeOf: SeoulStrawberryMilk.self)
        XCTAssertEqual(vendingMachine.showPurchasehistory(), [seoulMilk])
    }
}
