//
//  BeverageUnitTest.swift
//  VendingMachineAppTests
//
//  Created by 조중윤 on 2021/02/28.
//
//You need to import your project first

import XCTest

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
        XCTAssertTrue(cheapAndFreshHotAmericanoWithLowCaffeine.isHot())
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.isHot())
    }
    
    func test_normal_beverages_are_not_hot() {
        XCTAssertFalse(expensiveAndOldColdCaffeeLatteWithHighCaffeine.isHot())
    }
    
    func test_highCaffeine_beverages_contain_highCaffein() {
        XCTAssertTrue(expensiveAndOldColdCaffeeLatteWithHighCaffeine.highCaffeine())
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.highCaffeine())
        XCTAssertTrue(cheapAndFreshFantaWithHighCaffeineAndFoodColoring.highCaffeine())
    }
    
    func test_beverages_with_highCaffeine_and_foodColoring_are_bad_for_body() {
        XCTAssertTrue(cheapAndFreshFantaWithHighCaffeineAndFoodColoring.isBadForBody())
    }
    
    func test_beverages_with_highCaffeine_and_noFoodColoring_are_not_bad_for_body() {
        XCTAssertFalse(cheapAndFreshFantaWithHighCaffeineAndNoFoodColoring.isBadForBody())
    }
    
    
    func test_hot_beverages_with_highCaffeine_are_energyBoosting() {
        XCTAssertTrue(expensiveAndOldHotCaffeeLatteWithHighCaffeine.isEnergyBoosting())
    }
    
    func test_hot_but_lowCaffeine_beverages_are_not_energyBoosting() {
        XCTAssertFalse(cheapAndFreshHotAmericanoWithLowCaffeine.isEnergyBoosting())
    }
}
