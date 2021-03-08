//
//  VendinMachineAppTests.swift
//  VendinMachineAppTests
//
//  Created by user on 2021/03/05.
//

import XCTest

class BeveragesTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_Beverages_재고추가_재고삭제_재고확인() throws {
        let beverages = Beverages()
        let beverageFactory = BeverageFactory()
        let bananaMilk = beverageFactory.makeBeverage(BananaFlavorMilk())
        beverages.addSome(bananaMilk)
        XCTAssertTrue(beverages.isInStock(of: bananaMilk))

        beverages.remove(element: bananaMilk)
        XCTAssertFalse(beverages.isInStock(of: bananaMilk))
    }
    
    func test_Beverages_리스트출력확인() throws {
        let beverageFactory = BeverageFactory()
        let bananaMilk = beverageFactory.makeBeverage(BananaFlavorMilk())
        let chocoMilk = beverageFactory.makeBeverage(GhanaChocoMilk())
        let cocaCola = beverageFactory.makeBeverage(CocaCola())
        let cider = beverageFactory.makeBeverage(NarangdCider())
        let weakAmericano = beverageFactory.makeBeverage(WeakAmericano())
        let strongAmericano = beverageFactory.makeBeverage(StrongAmericano())
        let mochaLatte = beverageFactory.makeBeverage(LetsBeLatte())
        
        let beverages = Beverages()
        beverages.addSome(bananaMilk)
        beverages.addSome(chocoMilk)
        beverages.addSome(cocaCola)
        beverages.addSome(cider)
        beverages.addSome(weakAmericano)
        beverages.addSome(strongAmericano)
        beverages.addSome(mochaLatte)
        
        var otherBeverages = Beverages()
        otherBeverages.addSome(bananaMilk)
        XCTAssertEqual(beverages.yellowBananaMilkList(), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(strongAmericano)
        XCTAssertEqual(beverages.hotBeverageList(over: 50), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(bananaMilk)
        XCTAssertEqual(beverages.expiredBeverageList(on: Date().adding(days: 5)), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(strongAmericano)
        XCTAssertEqual(beverages.addedShotList(over: 2), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(mochaLatte)
        otherBeverages.addSome(cider)
        XCTAssertEqual(beverages.sameOriginBeverageList(madeIn: Korea()), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(cocaCola)
        XCTAssertEqual(beverages.lowCalorieBeverageList(below: 100), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(cider)
        XCTAssertEqual(beverages.beverageListOfTransparentPackage(), otherBeverages)
    }
}

