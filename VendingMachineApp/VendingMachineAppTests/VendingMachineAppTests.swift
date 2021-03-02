//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Ador on 2021/02/24.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    
    func testVendingMachine() {
        // 유통기한 지난 상품
        let start = "20201020"
        let end = "20201030"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.date(from: start)
        let expiredAt = dateFormatter.date(from: end)
       
        // 음료 객체
        let coffee = Coffee(manufacturer: "맥심", volume: 200, name: "맥심아메리카노", manufacturedAt: date!, price: 1000, caffeineContent: 20, temperature: 100, calorie: 100, expiredAt: expiredAt!)
        let drinks = Drinks()
        drinks.add(drink: coffee)
        
        var vm = VendingMachine(drinks: drinks)
        // 자판기의 모든 음료
        XCTAssertEqual(vm.getAllDrinks(), [coffee:1])
        
        // 현재 충전된 금액으로 구매 가능한 음료 목록
        XCTAssertEqual(vm.getAvailableDrinks(), [])
        
        // 유통기한 지난 음료
        XCTAssertEqual(vm.getExpiredDrinks(date: Date()), [coffee:1])
        
        // 따뜻한 음료
        XCTAssertEqual(vm.getHotDrinks(), [coffee])
        
        // 자판기 충전
        vm.charge(coins: 1000)

        // 현재 충전 금액으로 구입 가능한 음료 목록 출력
        XCTAssertEqual(vm.getAvailableDrinks(), [coffee])

        // 음료 구매
        guard let drink = vm.getAvailableDrinks().first else { return }
        vm.purchase(drink: drink)
        XCTAssertEqual(vm.getAvailableDrinks(), [])

        // 남은 코인 확인
        XCTAssertEqual(vm.checkRemainCoins(), 0)
        
        // 구매 이력 확인
        XCTAssertEqual(vm.getPurchaseHistory(), [coffee])
    }
}
