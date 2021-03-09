//
//  DrinksTest.swift
//  VendingMachineAppTests
//
//  Created by kiyoungj on 2021/03/06.
//

import XCTest
@testable import VendingMachineApp

class DrinksTest: XCTestCase {
    
    let drinks = Drinks()
    var milk001 = Milk.init(isMilkFlavor: .Strawberry, farmCode: "001", brand: "서울우유",
                            capacity: 200,
                            price: 1000,
                            name: "날마다딸기우유",
                            manufacturedAt: Date(), isHot: false)
    
    var milk002 = Milk.init(isMilkFlavor: .Strawberry, farmCode: "002", brand: "서울우유",
                            capacity: 200,
                            price: 1000,
                            name: "날마다딸기우유",
                            manufacturedAt: Date(), isHot: false)
    
    var soda001 = Soda.init(isSodaType: .Cola,
                            factoryCode:"01",
                            brand: "팹시",
                            capacity: 350,
                            price: 2000,
                            name: "다이어트콜라",
                            manufacturedAt: Date(), isHot: false)
    
    var coffee001 = Coffee.init(isDecaffeinated: 30, isHot: true, isCoffeeBrandName: .Cantata, brand: "맥심", capacity: 4000, price: 3000, name: "TOP아메리카노", manufacturedAt: Date())
    
    func test_addDrinkt() throws {
        drinks.addDrink(what: milk001)
        drinks.addDrink(what: milk002)
        drinks.addDrink(what: soda001)
        drinks.addDrink(what: coffee001)
    }
    
    func test_countDrinkStock() throws {
        drinks.addDrink(what: milk001)
        drinks.addDrink(what: milk002)
        drinks.addDrink(what: soda001)
        drinks.addDrink(what: coffee001)
        
        let totalCount = drinks.countDrinkStock()
        XCTAssertEqual(4,totalCount,"총 갯수가 다릅니다.")
    }
    
    func test_showHotDrinkCount() throws {
        drinks.addDrink(what: milk001)
        drinks.addDrink(what: milk002)
        drinks.addDrink(what: soda001)
        drinks.addDrink(what: coffee001)
        
        let hotDrinksCount = drinks.showHotDrinkCount()
        XCTAssertEqual(1,hotDrinksCount,"총 갯수가 다릅니다.")
    }
    
    func test_showHotDrink() throws {
        drinks.addDrink(what: milk001)
        drinks.addDrink(what: milk002)
        drinks.addDrink(what: soda001)
        drinks.addDrink(what: coffee001)
        
        let hotDrinks = drinks.showHotDrink()
        XCTAssertEqual(1,hotDrinks.count,"총 갯수가 다릅니다.")
    }
    
    func test_showExpiredDrinks() throws {
        drinks.addDrink(what: milk001)
        drinks.addDrink(what: milk002)
        drinks.addDrink(what: soda001)
        drinks.addDrink(what: coffee001)
        
        let nowDate = Date()
        let expiredDrinks = drinks.showExpiredDrinks(date: nowDate)
        XCTAssertEqual(4,expiredDrinks.count,"총 갯수가 다릅니다.")
    }
    
    func test_getPurchasableDrinks() throws {
        
        let nowMoney = 1000
        drinks.addDrink(what: milk001)
        drinks.addDrink(what: milk002)
        drinks.addDrink(what: soda001)
        drinks.addDrink(what: coffee001)
        
        let purchasableDrinks = drinks.getPurchasableDrinks(with: nowMoney)
        XCTAssertEqual(2,purchasableDrinks.count,"총 갯수가 다릅니다.")
    }
    
    func test_addPurchasedList() throws {
        let addPurchasedList = drinks.addPurchasedList(with: milk001)
        XCTAssertEqual(1,addPurchasedList.count,"총 갯수가 다릅니다.")

    }
}
