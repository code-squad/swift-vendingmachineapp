//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 오킹 on 2021/03/03.
//

import XCTest

class VendingMachineAppTests: XCTestCase {
    
    var vendingMachine = VendingMachine()
    var beverage = MilkFactory().create()
    var beverage2 = SodaFactory().create()
    var beverage3 = CoffeeFactory().create()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    
    }

    func test_잔액_확인() throws {
        XCTAssertEqual(vendingMachine.showCurrentMoney(), 0)
    }
    
    func test_자판기_금액_추가() throws {
        vendingMachine.putInMoney(3000)
        
        XCTAssertEqual(vendingMachine.showCurrentMoney(), 3000)
    }
    
    func test_음료_재고_추가() throws {
        vendingMachine.appendBeverage(beverage: beverage)
        vendingMachine.appendBeverage(beverage: beverage2)
        vendingMachine.appendBeverage(beverage: beverage3)
    }
    
    func test_구매_가능_음료목록() throws {
        vendingMachine.putInMoney(3000)
        
        vendingMachine.appendBeverage(beverage: beverage)
        vendingMachine.appendBeverage(beverage: beverage2)
        vendingMachine.appendBeverage(beverage: beverage3)
        
        XCTAssertEqual(vendingMachine.beverageListForPurchase(), [beverage,beverage2,beverage3])
    }
    
    func test_음료_구매() throws {
        vendingMachine.putInMoney(3000)
        
        vendingMachine.appendBeverage(beverage: beverage)
        vendingMachine.appendBeverage(beverage: beverage2)
        vendingMachine.appendBeverage(beverage: beverage3)
        
        vendingMachine.buyBeverage(beverage: beverage)
    }
    
    func test_전체상품_재고_확인() throws {
        vendingMachine.appendBeverage(beverage: beverage)
        vendingMachine.appendBeverage(beverage: beverage2)
        vendingMachine.appendBeverage(beverage: beverage3)
        
        XCTAssertEqual(vendingMachine.showAllBeverageList(), [beverage:1,beverage2:1,beverage3:1])
    }
    
    //TODO: Bug 수정
    func test_유통기한_넘은_재고목록() throws {
        var fakeBananaMilk = BananaMilk(brand: "테스트", capacity: 200, price: 1000, name: "바나나우유_테스트", manufacture: Date(), farmCode: "A_테스트", hasDoraemonSticker: true, expiry: Calendar.current.date(byAdding: .day, value: -5, to: Date())!)
    
            vendingMachine.appendBeverage(beverage: fakeBananaMilk)
    
            XCTAssertEqual(vendingMachine.showExpiryDateBeverage().map{$0 as! Beverage}, [fakeBananaMilk])
    }
    
    func test_따뜻한_음료_목록() throws {
        var fakeTop = Top(brand: "테스트", capacity: 300, price: 1000, name: "테스트", manufacture: Date(), isHot: true, hasSugar: true)
    
            vendingMachine.appendBeverage(beverage: fakeTop)
    
            XCTAssertEqual(vendingMachine.showHotBeverage().map{$0 as! Beverage}, [fakeTop])
    }
    
    //TODO: Bug 수정
    func test_상품_구매_이력() throws {
        vendingMachine.showPurchaseHistory()
        vendingMachine.appendBeverage(beverage: beverage)
        vendingMachine.appendBeverage(beverage: beverage2)
        vendingMachine.appendBeverage(beverage: beverage3)
        vendingMachine.buyBeverage(beverage: beverage)
        vendingMachine.buyBeverage(beverage: beverage2)
        
        XCTAssertEqual(vendingMachine.showPurchaseHistory(), [])
    }
}
