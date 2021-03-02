//
//  VendingMachineappTests.swift
//  VendingMachineappTests
//
//  Created by 심영민 on 2021/02/27.
//

import XCTest
@testable import VendingMachineapp

class VendingMachineappTests: XCTestCase {
    var machine = VendingMachine(money: 1000)
    
    func testVendingMachine() {
        let strawberryMilk = MilkFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1000,
                                         brand: "날마다딸기우유",
                                         manufactured: Date.stringToDate(date: "20171009"),
                                         expiryTime: Date.stringToDate(date: "20210227"),
                                         calorie: 200,
                                         temperature: 10)!
        
        let chocoMilk = MilkFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1100,
                                         brand: "날마다초코우유",
                                         manufactured: Date.stringToDate(date: "20201231"),
                                         expiryTime: Date.stringToDate(date: "20210115"),
                                         calorie: 200,
                                         temperature: 10)!
        
        let bananaMilk = MilkFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1200,
                                         brand: "날마다바나나우유",
                                         manufactured: Date.stringToDate(date: "20210201"),
                                         expiryTime: Date.stringToDate(date: "20200228"),
                                         calorie: 200,
                                         temperature: 10)!
        
        let coke = SodaFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 2000,
                              brand: "다이어트콜라",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiryTime: Date.stringToDate(date: "20221005"),
                              calorie: 100,
                              temperature: 10)!
        
        let sprite = SodaFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 1500,
                              brand: "스프라이트",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiryTime: Date.stringToDate(date: "20221005"),
                              calorie: 250,
                              temperature: 10)!
        
        let hwanta = SodaFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 1700,
                              brand: "환타",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiryTime: Date.stringToDate(date: "20221005"),
                              calorie: 300,
                              temperature: 10)!
        
        let top = CoffeeFactory.createBeverage(
                                 manufacturer: "맥심",
                                 volume: 300,
                                 price: 3500,
                                 brand: "TOP아메리카노",
                                 manufactured: Date.stringToDate(date: "20210110"),
                                 expiryTime: Date.stringToDate(date: "20210330"),
                                 calorie: 350,
                                 temperature: 20)!
        
        let cantata = CoffeeFactory.createBeverage(manufacturer: "맥심",
                                 volume: 400,
                                 price: 3000,
                                 brand: "칸타타",
                                 manufactured: Date.stringToDate(date: "20171010"),
                                 expiryTime: Date.stringToDate(date: "20211231"),
                                 calorie: 350,
                                 temperature: 50)!
        
        let georgia = CoffeeFactory.createBeverage(manufacturer: "맥심",
                                 volume: 400,
                                 price: 500,
                                 brand: "조지아",
                                 manufactured: Date.stringToDate(date: "20210203"),
                                 expiryTime: Date.stringToDate(date: "20210227"),
                                 calorie: 400,
                                 temperature: 10)!
        
        let beverageList: [Beverage:Int] = [
            strawberryMilk : 3,
            chocoMilk : 2,
            bananaMilk : 1,
            top : 3,
            cantata : 1,
            georgia : 1,
            coke : 2,
            sprite : 2,
            hwanta : 1
        ]
        machine.addBeverage(beverage: strawberryMilk)
        machine.addBeverage(beverage: strawberryMilk)
        machine.addBeverage(beverage: strawberryMilk)
        machine.addBeverage(beverage: chocoMilk)
        machine.addBeverage(beverage: chocoMilk)
        machine.addBeverage(beverage: bananaMilk)
        machine.addBeverage(beverage: top)
        machine.addBeverage(beverage: top)
        machine.addBeverage(beverage: top)
        machine.addBeverage(beverage: cantata)
        machine.addBeverage(beverage: georgia)
        machine.addBeverage(beverage: coke)
        machine.addBeverage(beverage: coke)
        machine.addBeverage(beverage: sprite)
        machine.addBeverage(beverage: sprite)
        machine.addBeverage(beverage: hwanta)
        
        XCTAssertEqual(machine.wholeBeverage(), beverageList)

        XCTAssertEqual(machine.availablePurchaseList(), [strawberryMilk, georgia])
        
        machine.increaseMoney(money: 10000)

        machine.purchaseBeverage(beverage: strawberryMilk)
        machine.purchaseBeverage(beverage: strawberryMilk)
        machine.purchaseBeverage(beverage: top)
        
        XCTAssertEqual(machine.purchasedList(), [strawberryMilk, strawberryMilk, top])
        XCTAssertEqual(machine.checkChagne(), 5500)
        
        XCTAssertEqual(machine.invalidateList(with: Date.stringToDate(date: "20210227")), [chocoMilk, chocoMilk, bananaMilk])

    }
}
