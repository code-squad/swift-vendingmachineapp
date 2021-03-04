//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 박정하 on 2021/03/03.
//

import XCTest

class VendingMachineAppTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }
    

    func testExample() throws {
        let beverageFactroy : BeverageCreater = BeverageCreater()
        let seoulMilk : Beverage = beverageFactroy.makeBeverage(Milk.init(taste: .chocolate, brand: "서울우유", volume: 255, price: 1800, name: "초코우유는 원래 초코색이다", manufactured: Date().stringTodate("20200101"), temperature: 70, kcal: 100))
        let starbucks : Beverage = Coffee.init(caffeineContent: 79, caffeine: false, taste: .latte, brand: "맥심", price: 900, name: "카누", manufactured: Date().stringTodate("20200302"),temperature: 70,kcal: 30)
        let Monster : Beverage = beverageFactroy.makeBeverage(Energydrink.init(flavor: .monster, brand: "HOT6", volume: 355, price: 2100, name: "몬스터", manufactured: Date().stringTodate("20200301"),temperature: 1, kcal: 90))
        let sevenStarCider : Beverage = beverageFactroy.makeBeverage(Soda.init(flavor: .lemon, brand: "코카콜라컴퍼니", volume: 255, price: 1700, name: "칠성사이다", manufactured: Date().stringTodate("20200303"),temperature: 8,kcal: 180))
        
        let beverges : [Beverage] = [seoulMilk, sevenStarCider, Monster, starbucks]
        let money : Money = Money.init(money: 0)
        let vendingMachine : VendingMachine = VendingMachine(Money: money)
        beverges.forEach{vendingMachine.addBeverage(beverage: $0)}
        vendingMachine.addMoney(money: Money.init(money: 1000))
        let canbuylist = [starbucks]
        XCTAssertEqual(vendingMachine.canBuyBeverage(), canbuylist)
    }
    

    func testPerformanceExample() throws {
        measure {
        }
    }

}
