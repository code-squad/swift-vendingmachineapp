//
//  VendinMachineTests.swift
//  VendingMachineAppTests
//
//  Created by HOONHA CHOI on 2021/02/25.
//


import XCTest
@testable import VendingMachineApp
class VendingMachineTests: XCTestCase {
    
    func testVendingMachine() {
        let strawberryMilk = StrawberryMilk.init(brand : "서울우유",
                                                    amount : 200,
                                                    unit : .Milliliter,
                                                    price: 1000,
                                                    name: "딸기우유",
                                                    manufactured: Date.make(date: "20210207"),
                                                    mlikFarmCode: 023,
                                                    expiration: Date.make(date: "20210210"), temperature : 10 ,calorie: 150, strawberryContent: 10)
        let dietCola =  DietCola.init(brand : "팹시",
                                      amount : 350,
                                      unit : .Milliliter,
                                      price: 2000,
                                      name: "다이어트콜라",
                                      manufactured: Date.make(date: "20210222"),sugarContent: 5,expiration: Date.make(date: "20210303"),temperature : 10,calorie: 123,taste: .lemon)
        
        let topAmericano =  TopAmericano.init(brand : "맥심",
                                              amount : 400,
                                              unit : .Milliliter,
                                              price: 3000,
                                              name: "TOP아메리카노",
                                              manufactured: Date.make(date: "20210217"),
                                              caffeineContent: 130,
                                              expiration: Date.make(date: "20210227"),
                                              temperature : 70, calorie : 100,coffeeSolids: 0.7)
        
        let vendingMachine = VendingMachine()
        vendingMachine.putPayMoney(money: 1000)
        vendingMachine.addStock(beverage: strawberryMilk)
        vendingMachine.addStock(beverage: dietCola)
        vendingMachine.addStock(beverage: topAmericano)
        vendingMachine.addStock(beverage: topAmericano)
        vendingMachine.addStock(beverage: topAmericano)
        
        XCTAssertEqual(vendingMachine.showPurchasePossibleList(), [strawberryMilk])
        
        vendingMachine.purchaseBeverage(beverage: strawberryMilk)
        
        XCTAssertEqual(vendingMachine.checkCurrentBalance(), 0)
        
        XCTAssertEqual(vendingMachine.showAllBeverageStock(), [dietCola : 1 , topAmericano : 3])
        
        XCTAssertEqual(vendingMachine.purchaseHistory(), [strawberryMilk])
        
        XCTAssertEqual(vendingMachine.verifyHotBeverages(standard : 65), [topAmericano,topAmericano,topAmericano])
        XCTAssertEqual(vendingMachine.outOfDateInventory(standard: Date()), [])
    }
}
