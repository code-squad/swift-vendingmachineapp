//
//  MachineUnitTest.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/03/02.
//

import XCTest

class MachineUnitTest: XCTestCase {
    var testMachine: Machine!
    var expensiveAndOldBeverage: Beverage!
    var expensiveButFreshBeverage: Beverage!
    var cheapAndFreshAndDomesticMilk: Milk!
    var expensiveAndOldOverseasBananaMilkWithFoodColoring: BananaMilk!
    var cheapButOldDomesticStrawberryMilkWithoutFoodColoring: StrawBerryMilk!
    var cheapAndFreshZeroCalorieSoda: Soda!
    var expensiveAndOldZeroCalorieCola: Cola!
    var cheapAndFreshFantaWithHighCaffeineAndFoodColoring: Fanta!
    var cheapAndFreshFantaWithHighCaffeineAndNoFoodColoring: Fanta!
    var expensiveButFreshCoffee: Coffee!
    var cheapAndFreshHotAmericanoWithLowCaffeine: Americano!
    var expensiveAndOldHotCaffeeLatteWithHighCaffeine: CaffeLatte!
    var expensiveAndOldColdCaffeeLatteWithHighCaffeine: CaffeLatte!
    var purchaseHistory: [Beverage]!
    
    override func setUpWithError() throws {
        testMachine = Machine()
        expensiveAndOldBeverage = BeverageFactory.makeBeverage(price: .high, packDate: .old)
        expensiveButFreshBeverage = BeverageFactory.makeBeverage(price: .high, packDate: .fresh)
        cheapAndFreshAndDomesticMilk = BeverageFactory.makeMilk(price: .low, packDate: .fresh, location: .domestic)
        expensiveAndOldOverseasBananaMilkWithFoodColoring = BeverageFactory.makeBananaMilk(price: .high, packDate: .old, location: .overseas, bananaFarm: .overseas, foodColoring: .foodColoring)
        cheapButOldDomesticStrawberryMilkWithoutFoodColoring = BeverageFactory.makeStrawBerryMilk(price: .low, packDate: .old, location: .domestic, strawBerryFarm: .domestic, foodColoring: .noFoodColoring)
        cheapAndFreshZeroCalorieSoda = BeverageFactory.makeSoda(price: .low, packDate: .fresh, isZeroCalories: true)
        expensiveAndOldZeroCalorieCola = BeverageFactory.makeCola(price: .high, packDate: .old, isZeroCalories: true)
        cheapAndFreshFantaWithHighCaffeineAndFoodColoring = BeverageFactory.makeFanta(price: .low, packDate: .fresh, isZeroCalories: false, foodColoring: .foodColoring, caffeine: .high)
        cheapAndFreshFantaWithHighCaffeineAndNoFoodColoring = BeverageFactory.makeFanta(price: .low, packDate: .fresh, isZeroCalories: false, foodColoring: .noFoodColoring, caffeine: .high)
        expensiveButFreshCoffee = BeverageFactory.makeCoffee(price: .high, packDate: .fresh)
        cheapAndFreshHotAmericanoWithLowCaffeine = BeverageFactory.makeAmericano(price: .low, packDate: .fresh, caffeine: .low, inHeatingCabinet: true)
        expensiveAndOldHotCaffeeLatteWithHighCaffeine = BeverageFactory.makeCaffeLatte(price: .high, packDate: .old, caffeine: .high, inHeatingCabinet: true)
        expensiveAndOldColdCaffeeLatteWithHighCaffeine = BeverageFactory.makeCaffeLatte(price: .high, packDate: .old, caffeine: .high, inHeatingCabinet: false)
    }

    override func tearDownWithError() throws {
        testMachine = nil
    }

    func test_can_initialize_machine() {
        let machine = Machine()
    }
    
    func test_add_money_to_moneyStorage() {
        let holding = 100_000
        testMachine.addMoneyHolding(by: holding)
        XCTAssertEqual(testMachine.showMoneyHolding(), holding)
    }
    
    func test_add_4_different_beverages_in_stock() {
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        testMachine.addStock(beverage: cheapAndFreshAndDomesticMilk, amount: 20)
        testMachine.addStock(beverage: cheapAndFreshFantaWithHighCaffeineAndFoodColoring, amount: 30)
        testMachine.addStock(beverage: expensiveAndOldHotCaffeeLatteWithHighCaffeine, amount: 40)
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 100)
        
        XCTAssertEqual(testMachine.checkStock()[expensiveAndOldBeverage], 110)
        XCTAssertEqual(testMachine.checkStock()[cheapAndFreshAndDomesticMilk], 20)
        XCTAssertEqual(testMachine.checkStock()[cheapAndFreshFantaWithHighCaffeineAndFoodColoring], 30)
        XCTAssertEqual(testMachine.checkStock()[expensiveAndOldHotCaffeeLatteWithHighCaffeine], 40)
    }
    
    func test_customer_insert_money() {
        let customerBudget = 10_000
        testMachine.receiveMoney(amount: customerBudget)
        XCTAssertEqual(testMachine.showInsertedCashBalance(), customerBudget)
    }
    
    func test_show_purchasables() {
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        testMachine.addStock(beverage: cheapAndFreshAndDomesticMilk, amount: 20)
        let purchasables = testMachine.showPurchasables(with: 4999)
        XCTAssertEqual(purchasables.count, 1)
        XCTAssertEqual(purchasables[cheapAndFreshAndDomesticMilk], 20)
    }
    
    func test_show_expried() {
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        testMachine.addStock(beverage: cheapAndFreshAndDomesticMilk, amount: 20)
        let expired = testMachine.showExpired()
        XCTAssertEqual(expired.count, 1)
        XCTAssertEqual(expired[expensiveAndOldBeverage], 10)
    }
    
    func test_purchase_beverage_successfully_with_enough_money() {
        testMachine.receiveMoney(amount: 1_000_000)
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        let itemPrice = expensiveAndOldBeverage.checkPrice()
        testMachine.purchaseBeverage(beverage: expensiveAndOldBeverage)
        testMachine.purchaseBeverage(beverage: expensiveAndOldBeverage)
        XCTAssertEqual(testMachine.checkStock()[expensiveAndOldBeverage], 8)
        XCTAssertEqual(testMachine.showMoneyHolding(), itemPrice * 2)
        XCTAssertEqual(purchaseHistory, [expensiveAndOldBeverage,expensiveAndOldBeverage])
    }
    
    func test_fail_purchase_beverage_with_not_enough_money() {
        testMachine.receiveMoney(amount: 10)
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: expensiveAndOldBeverage)
        XCTAssertEqual(testMachine.checkStock()[expensiveAndOldBeverage], 10)
        XCTAssertEqual(testMachine.showMoneyHolding(), 0)
    }
    
    func test_return_change_to_customer_when_transaction_stop_button_pressed() {
        let insertedMoney = 100_000
        testMachine.receiveMoney(amount: insertedMoney)
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: expensiveAndOldBeverage)
        let itemPrice = expensiveAndOldBeverage.checkPrice()
        XCTAssertEqual(testMachine.transactionStopButtonPressed(), insertedMoney - itemPrice)
    }
    
    func test_save_purchase_history() {
        let insertedMoney = 100_000
        testMachine.receiveMoney(amount: insertedMoney)
        testMachine.addStock(beverage: expensiveAndOldBeverage, amount: 10)
        testMachine.purchaseBeverage(beverage: expensiveAndOldBeverage)
        testMachine.purchaseBeverage(beverage: expensiveAndOldZeroCalorieCola)
        XCTAssertEqual(testMachine.showPurchaseHistory(), [expensiveAndOldBeverage, expensiveAndOldZeroCalorieCola])
        _ = testMachine.transactionStopButtonPressed()
        XCTAssertEqual(testMachine.showPurchaseHistory(), [])
    }
}
