//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by sonjuhyeong on 2021/03/05.
//

import XCTest

class VendingMachineAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_자판기_동작_테스트() throws {
        let vendingMachine = VendingMachine()
        
        let strawberryMilk = StrawberryMilk(brand: "서울우유", volume: 250, price: 1200, name: "서울딸기우유", manufacturedAt: Date.convertToDate("20210305"), temperature: 10.0, expirationDate: Date.convertToDate("20200312"), calory: 250, fatContent: 150.0, farmCode: StrawberryMilk.FarmCode.A)
        let coke = Coke(brand: "코카콜라", volume: 300, price: 1500, name: "코카콜라제로", manufacturedAt: Date.convertToDate("20210105"), temperature: 10.0, expirationDate: Date.convertToDate("20210302"), calory: 0, sugarContent: 0, package: Coke.Package.can)
        let cantata = Cantata(brand: "맥심", volume: 400, price: 3000, name: "TOP아메리카노", manufacturedAt: Date.convertToDate("20210203"), temperature: 67.0, expirationDate: Date.convertToDate("20210226"), calory: 200, caffeineContent: 30, beanOrigin: Cantata.BeanOrigin.colombia)
        
        vendingMachine.addStock(beverage: strawberryMilk)
        vendingMachine.addStock(beverage: coke)
        vendingMachine.addStock(beverage: cantata)
        
        // 현재 재고 확인
        XCTAssertEqual(vendingMachine.showCurrentStock(), ([strawberryMilk:1, coke:1, cantata:1]))
        
        // 금액 추가한 후 잔액 확인
        vendingMachine.addMoney(additionalAmount: 15000)
        XCTAssertEqual(15000, vendingMachine.showCurrentInputAmount())
        
        // 구매 가능한 음료 확인
        XCTAssertEqual(vendingMachine.showAvailableBeverage(), ([strawberryMilk,coke,cantata]))
        
        // 구매한 음료 확인
        XCTAssertEqual(vendingMachine.buyBeverage(beverage: strawberryMilk), (strawberryMilk))
        
        // 구매한 후 재고 확인
        XCTAssertEqual(vendingMachine.showCurrentStock(), ([coke:1 , cantata:1]))
        
        // 구매후 잔액 확인
        XCTAssertEqual(13800, vendingMachine.showCurrentInputAmount())
        
        // 뜨거운 음료 확인
        XCTAssertEqual(vendingMachine.checkHotBeverage(), ([cantata]))
        
        // 유통기한 지난 음료 확인
        XCTAssertEqual(vendingMachine.checkExpiredBeverage(), ([coke, cantata]))
        
        // 구매 목록 확인
        XCTAssertEqual(vendingMachine.showPurchasedList(),([strawberryMilk]))
    }
}
