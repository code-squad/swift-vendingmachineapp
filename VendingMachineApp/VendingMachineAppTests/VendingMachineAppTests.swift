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
        let seoulMilk : Beverage = beverageFactroy.makeBeverage(BananaMilk.init(sugarContent: 15, lowfat: false, brand: "서울우유", volume: 180, price: 900, name: "바나나는 원래 하얗다", manufactured: Date().stringTodate("20200101"), temperature: 10, kcal: 35))
        let starbucks : Beverage = beverageFactroy.makeBeverage(CaffeeLatte.init(sugar: false, caffeineContent: 35, caffeine: true, brand: "스타벅스", volume: 236, price: 2800, name: "카페라떼", manufactured: Date().stringTodate("20200302"), temperature: 75, kcal: 35))
        let Monster : Beverage = beverageFactroy.makeBeverage(Diablo.init(taurine: true, caffeine: true, brand: "코카콜라", volume: 255, price: 2100, name: "HOT6", manufactured: Date().stringTodate("20210301"), temperature: 1, kcal: 50))
        let sevenStarCider : Beverage = beverageFactroy.makeBeverage(Cider.init(appleContent: 30, sugar: false, brand: "와인사랑", volume: 355, price: 11000, name: "서머스비", manufactured: Date().stringTodate("20210226"), temperature: 0, kcal: 130))
        
        let beverges : [Beverage] = [seoulMilk, sevenStarCider, starbucks, Monster]
        let money : Money = Money.init(money: 1000)
        let vendingMachine : VendingMachine = VendingMachine(Money: money)
        beverges.forEach{vendingMachine.addBeverage(beverage: $0)}
        
        let canbuylist = [seoulMilk]
        let hotbeverage = [starbucks]
        let isValidate = [sevenStarCider, Monster]
        
        XCTAssertEqual(vendingMachine.canBuyBeverage(), canbuylist)
        XCTAssertEqual(vendingMachine.isHot(), hotbeverage)
        XCTAssertEqual(vendingMachine.isValidate(), isValidate)
    }
    

    func testPerformanceExample() throws {
        measure {
        }
    }

}
