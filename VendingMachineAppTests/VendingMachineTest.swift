//
//  VendingMachineTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/27.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineTest: XCTestCase {
    var vendingMachine : VendingMachine!
    
    override func setUp() {
        super.setUp()
    
        vendingMachine = VendingMachine()
        vendingMachine.charge(coins: 10000)
        vendingMachine.append(product: StroberryMilk())
        vendingMachine.append(product: ChocolateMilk())
        vendingMachine.append(product: Coke())
        vendingMachine.append(product: Top(brand: "Top", capacity: 100, price: 1000, name: "TOP", createdAt: Date(), expiredAt: Date(), caffeine: 100, temperature: 70, kind: .americano))
    }

    func testGetBalance() {
        let coins = 10000
        vendingMachine.charge(coins: coins)
        let expect = 20000
        
        XCTAssertEqual(expect, vendingMachine.getCoins(), "잔액이 일치하지 않습니다.")
    }
    
    func testAvailableProducts(){
        
        let expect = 4
        let actual = vendingMachine.availableProducts().count
        
        XCTAssertEqual(expect, actual, "구매 가능한 음료 목록이 올바르지 않습니다.")
    }

    func testExpiredProduct(){
        let actual = vendingMachine.expiredProduct().count
        let expect = 0
        
        XCTAssertEqual(expect, actual, "유통기한 체크 목록이 올바르지 않습니다.")
    }
    func testGetHotDrink(){
        
        let actual = vendingMachine.getHotDrink(than: 30).count
        let expect = 1
        
        XCTAssertEqual(expect, actual, "뜨거운 음료 목록을 받아오지 못하였습니다.")
    }
    func testGetSoldProducts(){
    
        let sprite = Factory.createInstance(type: Sprite.self)!
        vendingMachine.append(product: sprite)
        
        let prodcut = vendingMachine.getProduct(with: Sprite.self)!
        let expect = vendingMachine.purchase(with: prodcut)
        let actual = vendingMachine.getSoldProducts()
        
        XCTAssertEqual([expect], actual, "구매 이력을 받아오지 못하였습니다.")
    }
}
