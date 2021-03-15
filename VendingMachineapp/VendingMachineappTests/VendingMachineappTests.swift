//
//  VendingMachineappTests.swift
//  VendingMachineappTests
//
//  Created by 심영민 on 2021/02/27.
//

import XCTest
@testable import VendingMachineapp

class VendingMachineappTests: XCTestCase {
    var machine = VendingMachine()
    
    func testVendingMachine() {
        let strawberryMilk = BeverageFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1000,
                                         brand: "날마다딸기우유",
                                         manufactured: Date.stringToDate(date: "20171009"),
                                         expiry: Date.stringToDate(date: "20210227"),
                                         calorie: 200,
                                         temperature: 10,
                                         ofType: StrawberryMilk.self)!
        
        let chocoMilk = BeverageFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1100,
                                         brand: "날마다초코우유",
                                         manufactured: Date.stringToDate(date: "20201231"),
                                         expiry: Date.stringToDate(date: "20210115"),
                                         calorie: 200,
                                         temperature: 10,
                                         ofType: ChocoMilk.self)!
        
        let bananaMilk = BeverageFactory.createBeverage(
                                         manufacturer: "서울우유",
                                         volume: 200, price: 1200,
                                         brand: "날마다바나나우유",
                                         manufactured: Date.stringToDate(date: "20210201"),
                                         expiry: Date.stringToDate(date: "20200228"),
                                         calorie: 200,
                                         temperature: 10,
                                         ofType: BananaMilk.self)!
        
        let coke = BeverageFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 2000,
                              brand: "다이어트콜라",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiry: Date.stringToDate(date: "20221005"),
                              calorie: 100,
                              temperature: 10,
                              ofType: Coke.self)!
        
        let sprite = BeverageFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 1500,
                              brand: "스프라이트",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiry: Date.stringToDate(date: "20221005"),
                              calorie: 250,
                              temperature: 10,
                              ofType: Sprite.self)!
        
        let fanta = BeverageFactory.createBeverage(
                              manufacturer: "팹시",
                              volume: 350,
                              price: 1700,
                              brand: "환타",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expiry: Date.stringToDate(date: "20221005"),
                              calorie: 300,
                              temperature: 10,
                              ofType: Fanta.self)!
        
        let top = BeverageFactory.createBeverage(
                                 manufacturer: "맥심",
                                 volume: 300,
                                 price: 3500,
                                 brand: "TOP아메리카노",
                                 manufactured: Date.stringToDate(date: "20210110"),
                                 expiry: Date.stringToDate(date: "20210330"),
                                 calorie: 350,
                                 temperature: 20,
                                 ofType: Top.self)!
        
        let cantata = BeverageFactory.createBeverage(manufacturer: "맥심",
                                 volume: 400,
                                 price: 3000,
                                 brand: "칸타타",
                                 manufactured: Date.stringToDate(date: "20171010"),
                                 expiry: Date.stringToDate(date: "20211231"),
                                 calorie: 350,
                                 temperature: 50,
                                 ofType: Cantata.self)!
        
        let georgia = BeverageFactory.createBeverage(manufacturer: "맥심",
                                 volume: 400,
                                 price: 500,
                                 brand: "조지아",
                                 manufactured: Date.stringToDate(date: "20210203"),
                                 expiry: Date.stringToDate(date: "20210227"),
                                 calorie: 400,
                                 temperature: 10,
                                 ofType: Georgia.self)!
        
        let beverageList: [Beverage:Int] = [
            strawberryMilk : 3,
            chocoMilk : 2,
            bananaMilk : 1,
            top : 3,
            cantata : 1,
            georgia : 1,
            coke : 2,
            sprite : 2,
            fanta : 1
        ]
        machine.add(beverage: strawberryMilk)
        machine.add(beverage: strawberryMilk)
        machine.add(beverage: strawberryMilk)
        machine.add(beverage: chocoMilk)
        machine.add(beverage: chocoMilk)
        machine.add(beverage: bananaMilk)
        machine.add(beverage: top)
        machine.add(beverage: top)
        machine.add(beverage: top)
        machine.add(beverage: cantata)
        machine.add(beverage: georgia)
        machine.add(beverage: coke)
        machine.add(beverage: coke)
        machine.add(beverage: sprite)
        machine.add(beverage: sprite)
        machine.add(beverage: fanta)
        
        XCTAssertEqual(machine.wholeBeverage(), beverageList)
        machine.increase(money: Money(with: 1000))
        
        XCTAssertEqual(machine.availablePurchaseList(), [strawberryMilk, strawberryMilk, strawberryMilk, georgia])
        machine.increase(money: Money(with: 9000))
        
        machine.purchase(beverage: StrawberryMilk.self)
        machine.purchase(beverage: StrawberryMilk.self)
        machine.purchase(beverage: Top.self)
        
        XCTAssertEqual(machine.purchasedList(), [strawberryMilk, strawberryMilk, top])
        XCTAssertEqual(machine.checkChagne().money, 4500)
        
        XCTAssertEqual(machine.invalidateList(with: Date.stringToDate(date: "20210227")), [chocoMilk, chocoMilk, bananaMilk])

    }
}
