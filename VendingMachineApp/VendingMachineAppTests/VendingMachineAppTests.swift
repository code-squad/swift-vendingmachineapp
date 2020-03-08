//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by delma on 05/03/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    var vendingMachine = VendingMachine()
   let coffee = Mocha(manufacturer: "동서식품", brand: "스타벅스", capacity: 355, price: Money(balance: 2700), name: "스타벅스 모카", manufacturedDate: Date(), expirationDate:  Date(), isContainMilk: true, package: .glass, temperature: 8, isContainWheepCream: true)
    let soda = Coke(manufacturer: "코카콜라", brand: "코카콜라", capacity: 200, price: Money(balance: 2000), name: "코카콜라", manufacturedDate: Date(), expirationDate: Date(), sugarRatio: .lower, temperature: 2, cocaLeafRatio: 8.8)
    let milk = StrawberryMilk(manufacturer: "서울우유", brand: "서울우유", capacity: 200, price: Money(balance: 1200), name: "딸기맛 우유", manufacturedDate: Date(), expirationDate:  Date(), fatRatio: .original, temperature: 8, isLactoFree: false)
    
    override func setUp() {
        vendingMachine.addStock(coffee)
        vendingMachine.addStock(soda)
        vendingMachine.addStock(milk)
    }
    
    func testRaiseMoney() {
       vendingMachine.raiseMoney(fiveThousandCount: 2, thousandCount: 2, fiveHundredCount: 1, hundredCount: 2)
        let leftMoney = vendingMachine.confirmBalance()
        XCTAssertEqual(leftMoney.balance, 12700)
    }
    
    func testAvailableBeverageNowMoney() {
         vendingMachine.raiseMoney(fiveThousandCount: 2, thousandCount: 2, fiveHundredCount: 1, hundredCount: 2)
        let availabeBeverage = vendingMachine.reportAvailableBeverageNowMoney()
        XCTAssertEqual(availabeBeverage.contains(coffee), true)
        XCTAssertEqual(availabeBeverage.contains(soda), true)
        XCTAssertEqual(availabeBeverage.contains(milk), true)
    }
    
    func testPurchaseBeverage() {
        vendingMachine.raiseMoney(fiveThousandCount: 2, thousandCount: 2, fiveHundredCount: 1, hundredCount: 2)
        vendingMachine.purchaseBeverage(beverage: coffee, price: coffee.price)
        XCTAssertEqual(vendingMachine.balance.balance, 10000)
    }
    
    func testPurchaseHistory() {
        vendingMachine.purchaseBeverage(beverage: coffee, price: coffee.price)
        let history = vendingMachine.reportPurchasedHistory()
        XCTAssertEqual(history.contains(coffee), true)
        XCTAssertEqual(history.contains(milk), false)
        XCTAssertEqual(history.contains(soda), false)
    }
    
}
