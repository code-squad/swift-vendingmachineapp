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
    // 시나리오1 : 통합테스트 모든 재고를 추가하고 1000원을 넣었을때
    //           잔액확인, 재고확인
    func test통합테스트_시나리오1() {
        let stockBox = [orignalCoke, lightMilk, badLightMilk, starBucksCoffee]
        let machine = VendingMachineData(stock: stockBox)
        machine.addBeverage(sprite)
        machine.insertMoney(1000)
        _ = try? machine.buyBeverage(sprite)
        XCTAssertEqual(300, machine.balance)
        XCTAssertEqual(0, machine.sortedStockList[sprite]!)
    }

}
