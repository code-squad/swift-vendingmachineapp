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
    
    func test_Hash() {
        guard let blueBottle = DrinkFactory.makeDrink(of: BlueBottleColdBrew.self, manufactured: Date() - 1) else { return }
        guard let starbucks = DrinkFactory.makeDrink(of: StarbucksColdBrew.self, manufactured: Date() - 1) else { return }
        guard let bananaMilk = DrinkFactory.makeDrink(of: BingBananaMilk.self, manufactured: Date() - 1) else { return }
        guard let sanpellegrino = DrinkFactory.makeDrink(of: Sanpellegrino.self, manufactured: Date() - 1) else { return }
        guard let fanta = DrinkFactory.makeDrink(of: Fanta.self, manufactured: Date() - 1) else { return }
        guard let seoulMilk = DrinkFactory.makeDrink(of: SeoulStrawberryMilk.self, manufactured: Date() - 1) else { return }
        guard let seoulMilkB = DrinkFactory.makeDrink(of: SeoulStrawberryMilk.self, manufactured: Date() - 1) else { return }
        
        vendingMachine.addDrink(blueBottle)
        vendingMachine.addDrink(starbucks)
        vendingMachine.addDrink(bananaMilk)
        vendingMachine.addDrink(sanpellegrino)
        vendingMachine.addDrink(fanta)
        vendingMachine.addDrink(seoulMilk)
        vendingMachine.addDrink(seoulMilkB)
        vendingMachine.insertCoin(10000)
        XCTAssertEqual(vendingMachine.availableDrink().count, [blueBottle, starbucks, bananaMilk, sanpellegrino, fanta, seoulMilk, seoulMilkB].count)
    }
    
    func test창고안에서_따듯한_Drink_반환() {
        XCTAssertEqual(vendingMachine.findWarmDrinks(), [])
    }
    
    func test구입_후_구매이력_반환() {
        let seoulMilk = DrinkFactory.makeDrink(of: SeoulStrawberryMilk.self)!
        vendingMachine.addDrink(seoulMilk)
        vendingMachine.insertCoin(10000)
        _ = vendingMachine.buy(typeOf: SeoulStrawberryMilk.self)
        // 이전에 저장된 우유가 구입되어서 다를 수 있음
        XCTAssertEqual(vendingMachine.showPurchasehistory(), [seoulMilk])
    }
    
    func test_stock_counting() {
        print("왜")
        guard let blueBottle = DrinkFactory.makeDrink(of: BlueBottleColdBrew.self, manufactured: Date() - 1) else { return }
        guard let blueBottleB = DrinkFactory.makeDrink(of: BlueBottleColdBrew.self, manufactured: Date() - 1) else { return }
        guard let bananaMilk = DrinkFactory.makeDrink(of: BingBananaMilk.self, manufactured: Date() - 1) else { return }
        guard let bananaMilkB = DrinkFactory.makeDrink(of: BingBananaMilk.self, manufactured: Date() - 1) else { return }
        guard let bananaMilkC = DrinkFactory.makeDrink(of: BingBananaMilk.self, manufactured: Date() - 1) else { return }
        vendingMachine.addDrink(blueBottle)
        vendingMachine.addDrink(blueBottleB)
        vendingMachine.addDrink(bananaMilk)
        vendingMachine.addDrink(bananaMilkB)
        vendingMachine.addDrink(bananaMilkC)
        
        var count = 0
        vendingMachine.showStock().values.forEach { (drinks) in
            count += drinks.count
        }
        
        XCTAssertEqual(count, 5)
    }
}
