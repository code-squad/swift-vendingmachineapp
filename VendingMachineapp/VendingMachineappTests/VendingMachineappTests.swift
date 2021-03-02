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
        let strawberryMilk = StrawberryMilk(manufacturer: "서울우유",
                                         volume: 200, price: 1000,
                                         brand: "날마다딸기우유",
                                         manufactured: Date.stringToDate(date: "20171009"),
                                         expirydate: Date.stringToDate(date: "20210227"),
                                         calorie: 200,
                                         temperature: 10,
                                         lowFat: false)
        
        let chocoMilk = ChocoMilk(manufacturer: "서울우유",
                                         volume: 200, price: 1100,
                                         brand: "날마다초코우유",
                                         manufactured: Date.stringToDate(date: "20201231"),
                                         expirydate: Date.stringToDate(date: "20210115"),
                                         calorie: 200,
                                         temperature: 10,
                                         lowFat: false)
        
        let bananaMilk = BananaMilk(manufacturer: "서울우유",
                                         volume: 200, price: 1200,
                                         brand: "날마다바나나우유",
                                         manufactured: Date.stringToDate(date: "20210201"),
                                         expirydate: Date.stringToDate(date: "20200228"),
                                         calorie: 200,
                                         temperature: 10,
                                         lowFat: true)
        
        let coke = Coke(manufacturer: "팹시",
                              volume: 350,
                              price: 2000,
                              brand: "다이어트콜라",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expirydate: Date.stringToDate(date: "20221005"),
                              calorie: 100,
                              temperature: 10,
                              flavor: "콜라맛")
        
        let sprite = Sprite(manufacturer: "팹시",
                              volume: 350,
                              price: 1500,
                              brand: "스프라이트",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expirydate: Date.stringToDate(date: "20221005"),
                              calorie: 250,
                              temperature: 10,
                              flavor: "사이다맛")
        
        let hwanta = Hwanta(manufacturer: "팹시",
                              volume: 350,
                              price: 1700,
                              brand: "환타",
                              manufactured: Date.stringToDate(date: "20171005"),
                              expirydate: Date.stringToDate(date: "20221005"),
                              calorie: 300,
                              temperature: 10,
                              flavor: "환타맛")
        
        let top = Top(manufacturer: "맥심",
                                 volume: 300,
                                 price: 3500,
                                 brand: "TOP아메리카노",
                                 manufactured: Date.stringToDate(date: "20210110"),
                                 expirydate: Date.stringToDate(date: "20210330"),
                                 calorie: 350,
                                 temperature: 20,
                                 caffeineContent: 20)
        
        let cantata = Cantata(manufacturer: "맥심",
                                 volume: 400,
                                 price: 3000,
                                 brand: "Cantata",
                                 manufactured: Date.stringToDate(date: "20171010"),
                                 expirydate: Date.stringToDate(date: "20211231"),
                                 calorie: 350,
                                 temperature: 50,
                                 caffeineContent: 40)
        
        let georgia = Georgia(manufacturer: "맥심",
                                 volume: 400,
                                 price: 500,
                                 brand: "Georgia",
                                 manufactured: Date.stringToDate(date: "20210203"),
                                 expirydate: Date.stringToDate(date: "20210227"),
                                 calorie: 400,
                                 temperature: 10,
                                 caffeineContent: 50)
        
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
