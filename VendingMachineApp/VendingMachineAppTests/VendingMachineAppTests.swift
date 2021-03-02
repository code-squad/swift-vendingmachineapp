//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 양준혁 on 2021/03/02.
//

import XCTest

class VendingMachineAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_자판기() {
        let vendingMachine = VendingMachine()
        let strawberryMilk = StrawBerryMilk(brand: "서울우유", capacity: 300, price: 800, name: "딸기우유", dateOfManufacture: Date.input("20210302"), expirationDate: Date.input("20210310"), temperature: 5, pH: 6.5, color: StrawBerryMilk.Color.red)
        let redBull = RedBull(brand: "RedBull", capacity: 250, price: 1000, name: "레드불", dateOfManufacture: Date.input("20210302"), expirationDate: Date.input("20210310"), temperature: 5, taurineContent: 1000, vitaminB: 2)
        let top = TOP(brand: "동서식품", capacity: 380, price: 2000, name: "TOP", dateOfManufacture: Date.input("20210222"), expirationDate: Date.input("20210301"), temperature: 65, caffeineContent: 94, flavor: TOP.Flavor.americano)
        
        //자판기 금액 충전
        vendingMachine.rechargeCash(with: 10000)
        
        //재고추가
        vendingMachine.addStock(beverage: strawberryMilk)
        vendingMachine.addStock(beverage: redBull)
        vendingMachine.addStock(beverage: top)
        
        // 구매가능한 음료수 목록
        XCTAssertEqual(vendingMachine.showListForPurchase(), [strawberryMilk, redBull, top])
        
        vendingMachine.buy(redBull)
        
        // 잔액확인
        XCTAssertEqual(vendingMachine.showBalance(), 9000)
        
        // 전체 상품 재고를 종류별로 확인
        XCTAssertEqual(vendingMachine.showStock(), [strawberryMilk:1, top:1])
        
        // 유통기한이 지난 재고 확인
        XCTAssertEqual(vendingMachine.showExpiredStock(), [top])
        
        // 남은 재고중에서 따뜻한 음료확인
        XCTAssertEqual(vendingMachine.showHotBeverageList(), [top])
        
        // 구매 상품 이력 확인
        XCTAssertEqual(vendingMachine.showPurchasedList(), [redBull])
        
    }

}
