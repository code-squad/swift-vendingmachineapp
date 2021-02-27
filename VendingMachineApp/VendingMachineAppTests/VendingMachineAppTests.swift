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
        let stringDate = "20201020"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.date(from: stringDate)
       
        // 음료 객체
        let coffee = Coffee(manufacturer: "맥심", volume: 200, name: "맥심아메리카노", dateOfManufacture: date!, price: 1000, caffeineContent: 20, temperature: 100)
        let drinks = Drinks()
        drinks.add(drink: coffee)
        
        var vm = VendingMachine(drinks: drinks)
        
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

        XCTAssertEqual(vm.checkRemainCoins(), 0)
    }
}
