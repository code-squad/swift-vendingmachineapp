//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    let orignalCoke = Coke(manufacturingDate: Date())
    let orignalCoke2 = Coke(manufacturingDate: Date())
    let sprite = Sprite(manufacturingDate: Date())
    let lightMilk = LightBananaMilk(manufacturingDate: Date())
    let badLightMilk = LightBananaMilk(manufacturingDate: Date())
    let starBucksCoffee = StarBucksCoffee(manufacturingDate: Date())
    // 시나리오1 : 통합테스트 모든 재고를 추가하고 1000원을 넣었을때, 구매 가능한 음료 반환 테스트
    //           잔액확인, 재고확인, 구매이력 확인
    func test통합테스트_시나리오1() {
        let stockBox = [orignalCoke, lightMilk, badLightMilk, starBucksCoffee]
        let beverageData = VendingMachineData(stock: stockBox)
        var adminMachine = AdminVendingMachine(with: beverageData)
        adminMachine.addBeverage(item: sprite)
        var userMachine = UserVendingMachine(with: beverageData)
        userMachine.insertMoney(1000)
        var validStock = userMachine.getValidBuyingBeverage()
        XCTAssertEqual(orignalCoke.description, validStock[1].description)
        XCTAssertEqual(sprite.description, validStock[2].description)
        _ = try? userMachine.buyBeverage(sprite)
        XCTAssertEqual(300, userMachine.getBalance())
        XCTAssertEqual(0, userMachine.getStockList()[sprite]!)
        XCTAssertEqual("Sprite", userMachine.getRecepit()[0])
    }

}
