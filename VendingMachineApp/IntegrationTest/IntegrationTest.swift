//
//  IntegrationTest.swift
//  IntegrationTest
//
//  Created by TTOzzi on 2020/02/25.
//  Copyright © 2020 TTOzzi. All rights reserved.
//
@testable import VendingMachineApp
import XCTest

class IntegrationTest: XCTestCase {

    var myVendingMachine: VendingMachine!
    var bananaMilk: BananaMilk!
    var strawberryMilk: StrawberryMilk!
    var cantataCoffee: Cantata!
    var cola: Cola!
    
    
    override func setUp() {
        super.setUp()
        myVendingMachine = VendingMachine()
        bananaMilk = BananaMilk(brand: "빙그레", amount: 240, price: Money(amount: 1000), name: "바나나맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 15, bananaContent: 3)
        strawberryMilk = StrawberryMilk(brand: "빙그레", amount: 240, price:  Money(amount: 1000), name: "딸기맛우유", calorie: 208, saleablePeriod: 14, fatRatio: 12, strawberryContent: 5)
        cantataCoffee = Cantata(brand: "롯데", amount: 500, price:  Money(amount: 3000), name: "콘트라베이스 콜드브루", calorie: 20, saleablePeriod: 270, caffeineContent: 179, isHot: true)
        cola = Cola(brand: "코카콜라", amount: 355, price:  Money(amount: 2000), name: "코카콜라", calorie: 99, saleablePeriod: 200, sugarContent: 15)
    }

    func test() {
        // 음료 추가
        myVendingMachine.addBeverage(beverage: bananaMilk)
        myVendingMachine.addBeverage(beverage: bananaMilk)
        myVendingMachine.addBeverage(beverage: strawberryMilk)
        myVendingMachine.addBeverage(beverage: cantataCoffee)
        myVendingMachine.addBeverage(beverage: cola)
        // 추가한 음료 갯수 확인
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 5)
        // 2000원 넣음
        myVendingMachine.putMoney( Money(amount: 2000))
        // 구매가능 음료 확인, 커피를 제외한 음료 4개 구매 가능
        XCTAssertEqual(myVendingMachine.purchasableList.count, 4)
        // 바나나맛우유 구매, 바나나맛우유를 제대로 반환했는지 확인
        XCTAssertEqual(bananaMilk, myVendingMachine.buy(beverage: bananaMilk))
        // 재고 갯수 감소 확인
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 4)
        // 남은 잔액 확인
        XCTAssertEqual(myVendingMachine.checkBalance(), Money(amount: 1000))
        // 구매가능 음료 확인, 1000원짜리 음료 두개 구매가능
        XCTAssertEqual(myVendingMachine.purchasableList.count, 2)
        // 비싼커피 구매 시도 -> nil 반환
        XCTAssertNil(myVendingMachine.buy(beverage: cantataCoffee))
        // 잔액 그대로인지 확인
        XCTAssertEqual(myVendingMachine.checkBalance(), Money(amount: 1000))
        // 딸기맛우유 구매, 딸기맛우유를 제대로 반환했는지 확인
        XCTAssertEqual(strawberryMilk, myVendingMachine.buy(beverage: strawberryMilk))
        // 남은 잔액 확인
        XCTAssertEqual(myVendingMachine.checkBalance(), Money())
        // 재고 갯수 감소 확인
        XCTAssertEqual(myVendingMachine.stock.beverages.count, 3)
        // 구매가능 음료 확인
        XCTAssertEqual(myVendingMachine.purchasableList.count, 0)
        // 구매내역 확인
        XCTAssertEqual(myVendingMachine.purchaseHistory[0], bananaMilk)
        XCTAssertEqual(myVendingMachine.purchaseHistory[1], strawberryMilk)
    }
}
