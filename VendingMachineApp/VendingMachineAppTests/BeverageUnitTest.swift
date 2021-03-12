//
//  BeverageUnitTest.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/02/28.
//
//You need to import your project first

import XCTest

//FIXME
class BeverageUnitTest: XCTestCase {
    //And call the desirable module to be tested
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
    
    override func setUp() {
        super.setUp()

        // 5000 and above considerd expensive
//        expensiveAndOldBeverage = BeverageFactory.makeBeverage(price: .high, packageTime: .old)
//        expensiveButFreshBeverage = BeverageFactory.makeBeverage(price: .high, packageTime: .fresh)
//        cheapAndFreshAndDomesticMilk = BeverageFactory.makeMilk(price: .low, packageTime: .fresh, location: .domestic)
//        expensiveAndOldOverseasBananaMilkWithFoodColoring = BeverageFactory.makeBananaMilk(price: .high, packageTime: .old, location: .overseas, bananaFarm: .overseas, foodColoring: .foodColoring)
//        cheapButOldDomesticStrawberryMilkWithoutFoodColoring = BeverageFactory.makeStrawBerryMilk(price: .low, packageTime: .old, location: .domestic, strawBerryFarm: .domestic, foodColoring: .noFoodColoring)
//        cheapAndFreshZeroCalorieSoda = BeverageFactory.makeSoda(price: .low, packageTime: .fresh, calories: 0)
//        expensiveAndOldZeroCalorieCola = BeverageFactory.makeCola(price: .high, packageTime: .old)
//        cheapAndFreshFantaWithHighCaffeineAndFoodColoring = BeverageFactory.makeFanta(price: .low, packageTime: .fresh, calories: 0, foodColoring: .foodColoring, caffeine: .high)
//        cheapAndFreshFantaWithHighCaffeineAndNoFoodColoring = BeverageFactory.makeFanta(price: .low, packageTime: .fresh, calories: 0, foodColoring: .noFoodColoring, caffeine: .high)
//        expensiveButFreshCoffee = BeverageFactory.makeCoffee(price: .high, packageTime: .fresh)
//        cheapAndFreshHotAmericanoWithLowCaffeine = BeverageFactory.makeAmericano(price: .low, packageTime: .fresh, caffeine: .low, temperature: 50)
//        expensiveAndOldHotCaffeeLatteWithHighCaffeine = BeverageFactory.makeCaffeLatte(price: .high, packageTime: .old, caffeine: .high, temperature: 50)
//        expensiveAndOldColdCaffeeLatteWithHighCaffeine = BeverageFactory.makeCaffeLatte(price: .high, packageTime: .old, caffeine: .high, temperature: 50)
    }
    
    override func tearDown() {
        expensiveAndOldBeverage = nil
        expensiveButFreshBeverage = nil
        cheapAndFreshAndDomesticMilk = nil
        expensiveAndOldOverseasBananaMilkWithFoodColoring = nil
        cheapButOldDomesticStrawberryMilkWithoutFoodColoring = nil
        cheapAndFreshZeroCalorieSoda = nil
        expensiveAndOldZeroCalorieCola = nil
        cheapAndFreshFantaWithHighCaffeineAndFoodColoring = nil
        expensiveButFreshCoffee = nil
        cheapAndFreshHotAmericanoWithLowCaffeine = nil
        expensiveAndOldHotCaffeeLatteWithHighCaffeine = nil
        expensiveAndOldColdCaffeeLatteWithHighCaffeine = nil
        super.tearDown()
    }
    
    func test_cheap_beverages_are_purchasable() {
        let highestPriceAmongCheapBeverage: Int = 4999
        let zeroBudget: Int = 0
        XCTAssertTrue(cheapAndFreshAndDomesticMilk.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertTrue(cheapButOldDomesticStrawberryMilkWithoutFoodColoring.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertTrue(cheapAndFreshZeroCalorieSoda.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertTrue(cheapAndFreshFantaWithHighCaffeineAndFoodColoring.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertTrue(cheapAndFreshHotAmericanoWithLowCaffeine.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertFalse(cheapAndFreshHotAmericanoWithLowCaffeine.isPurchasable(with: zeroBudget))
    }
    
    func test_expensive_beverages_are_not_purchasable() {
        let highestPriceAmongCheapBeverage: Int = 4999
        let hugeAmountOfMoney: Int = 999_999
        XCTAssertFalse(expensiveAndOldBeverage.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertFalse(expensiveButFreshBeverage.isPurchasable(with: highestPriceAmongCheapBeverage))
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.isPurchasable(with: hugeAmountOfMoney))
    }
    
    
    func test_old_beverages_are_expired() {
        XCTAssertTrue(expensiveAndOldBeverage.isExpired())
        XCTAssertTrue(expensiveAndOldOverseasBananaMilkWithFoodColoring.isExpired())
        XCTAssertTrue(cheapButOldDomesticStrawberryMilkWithoutFoodColoring.isExpired())
        XCTAssertTrue(expensiveAndOldZeroCalorieCola.isExpired())
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.isExpired())
    }
    
    func test_fresh_beverages_are_not_expired() {
        XCTAssertFalse(cheapAndFreshZeroCalorieSoda.isExpired())
        XCTAssertFalse(expensiveButFreshBeverage.isExpired())
        XCTAssertFalse(expensiveButFreshCoffee.isExpired())
        XCTAssertFalse(cheapAndFreshAndDomesticMilk.isExpired())
    }
    
    func test_hot_beverages_are_hot() {
        XCTAssertTrue(cheapAndFreshHotAmericanoWithLowCaffeine.isHot(temperature: 40))
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.isHot(temperature: 40))
    }
    
    func test_normal_beverages_are_not_hot() {
        XCTAssertFalse(expensiveAndOldColdCaffeeLatteWithHighCaffeine.isHot(temperature: 100))
    }
    
    func test_highCaffeine_beverages_contain_highCaffein() {
        XCTAssertTrue(expensiveAndOldColdCaffeeLatteWithHighCaffeine.highCaffeine(caffeine: 100))
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.highCaffeine(caffeine: 100))
        XCTAssertTrue(cheapAndFreshFantaWithHighCaffeineAndFoodColoring.highCaffeine(caffeine: 100))
    }
    
    func test_beverages_with_highCaffeine_and_foodColoring_are_bad_for_body() {
        XCTAssertTrue(cheapAndFreshFantaWithHighCaffeineAndFoodColoring.isBadForBody(caffeine: 100))
    }
    
    func test_beverages_with_highCaffeine_and_noFoodColoring_are_not_bad_for_body() {
        XCTAssertFalse(cheapAndFreshFantaWithHighCaffeineAndNoFoodColoring.isBadForBody(caffeine: 100))
    }
    
    
    func test_hot_beverages_with_highCaffeine_are_energyBoosting() {
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.isEnergyBoosting(caffeine: 100, temperature: 40))
    }
    
    func test_hot_but_lowCaffeine_beverages_are_not_energyBoosting() {
        XCTAssertFalse(cheapAndFreshHotAmericanoWithLowCaffeine.isEnergyBoosting(caffeine: 100, temperature: 40))
    }
}
