//
//  VendinMachineAppTests.swift
//  VendinMachineAppTests
//
//  Created by user on 2021/03/05.
//

import XCTest

class VendingMachineTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_잔액확인_잔액추가() throws {
        var vendingMachine = VendingMachine()
        
        XCTAssertEqual(vendingMachine.cashBox, 0)
        
        vendingMachine.insertCash(amount: 1000)
        XCTAssertEqual(vendingMachine.cashBox, 1000)
    }
    
    func test_현재잔액으로_살수있는재고확인_재고구매_재고확인_구매이력확인() throws {
        let beverageFactory = BeverageFactory()
        let bananaMilk = beverageFactory.makeBeverage(BananaFlavorMilk())
        let chocoMilk = beverageFactory.makeBeverage(GhanaChocoMilk())
        let cocaCola = beverageFactory.makeBeverage(CocaCola())
        let cider = beverageFactory.makeBeverage(NarangdCider())
        let weakAmericano = beverageFactory.makeBeverage(WeakAmericano())
        let strongAmericano = beverageFactory.makeBeverage(StrongAmericano())
        let mochaLatte = beverageFactory.makeBeverage(LetsBeLatte())
        
        var vendinMachine = VendingMachine()
        vendinMachine.addBeverageStock(bananaMilk)
        vendinMachine.addBeverageStock(chocoMilk)
        vendinMachine.addBeverageStock(cocaCola)
        vendinMachine.addBeverageStock(cider)
        vendinMachine.addBeverageStock(weakAmericano)
        vendinMachine.addBeverageStock(strongAmericano)
        vendinMachine.addBeverageStock(mochaLatte)
        
        vendinMachine.insertCash(amount: 1000)
        var otherBeverages = Beverages()
        otherBeverages.addSome(chocoMilk)
        otherBeverages.addSome(cider)
        otherBeverages.addSome(mochaLatte)
        XCTAssertEqual(vendinMachine.buyableBeverageList(), otherBeverages)
        
        vendinMachine.insertCash(amount: 500)
        XCTAssertEqual(vendinMachine.buy(beverage: chocoMilk), chocoMilk)
        XCTAssertEqual(vendinMachine.buy(beverage: mochaLatte), mochaLatte)
        
        otherBeverages.remove(element: cider)
        XCTAssertEqual(vendinMachine.shoppingHistory(), otherBeverages)
        
        otherBeverages = Beverages()
        otherBeverages.addSome(bananaMilk)
        otherBeverages.addSome(cocaCola)
        otherBeverages.addSome(cider)
        otherBeverages.addSome(weakAmericano)
        otherBeverages.addSome(strongAmericano)
        XCTAssertEqual(vendinMachine.totalBeverageStockList(), otherBeverages)
        
        XCTAssertEqual(vendinMachine.cashBox, 0)
        
    }
    
}

