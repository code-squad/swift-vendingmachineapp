//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Issac on 2021/02/27.
//

import XCTest
//@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
    }

    override func tearDown() {
        self.vendingMachine = nil
        super.tearDown()
    }
    
    func test보관중인_Drink_갯수() {
        guard let blueBottle = DrinkFactory.makeDrink(of: BlueBottleColdBrew.self) else { return }
        guard let starbucks = DrinkFactory.makeDrink(of: StarbucksColdBrew.self) else { return }
        guard let bananaMilk = DrinkFactory.makeDrink(of: BingBananaMilk.self) else { return }
        guard let sanpellegrino = DrinkFactory.makeDrink(of: Sanpellegrino.self) else { return }
        guard let fanta = DrinkFactory.makeDrink(of: Fanta.self, manufactured: Date() - 365) else { return }
        guard let seoulMilk = DrinkFactory.makeDrink(of: SeoulStrawberryMilk.self) else { return }
        
        // Productization을 채택하지 않은 Soda 클래스
        let weirdSoda = Soda(brand: "탄산회사", capacity: 500, price: 1500, name: "정체모를 탄산수", isZeroCalorie: true, manufactured: Date(), temperature: 15, calorie: 150)
        
        vendingMachine.addDrink(blueBottle)
        vendingMachine.addDrink(starbucks)
        vendingMachine.addDrink(bananaMilk)
        vendingMachine.addDrink(sanpellegrino)
        vendingMachine.addDrink(fanta)
        vendingMachine.addDrink(weirdSoda)
        vendingMachine.addDrink(seoulMilk)
        
        XCTAssertEqual(vendingMachine.showStock().count, 6)
    }
    
    func test창고안에서_따듯한_Drink_반환() {
        XCTAssertEqual(vendingMachine.findWarmDrinks(), [])
    }
    
    func test_이전_데이터가_있는지() {
        var count = 0
        vendingMachine.showStock().keys.forEach { (key) in
            count += 1
        }
        print(vendingMachine.showStock())
        XCTAssertGreaterThan(count, 0)
    }
    
    func test구입_후_구매이력_반환() {
        let seoulMilk = DrinkFactory.makeDrink(of: SeoulStrawberryMilk.self)!
        vendingMachine.addDrink(seoulMilk)
        vendingMachine.insertCoin(10000)
        _ = vendingMachine.buy(typeOf: SeoulStrawberryMilk.self)
        // 이전에 저장된 우유가 구입되어서 다를 수 있음
        XCTAssertEqual(vendingMachine.showPurchasehistory(), [seoulMilk])
    }
}
