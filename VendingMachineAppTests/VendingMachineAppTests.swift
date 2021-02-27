//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/25.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {

    var vendinMachine : VendingMachine!
    
    override func setUp() {
        super.setUp()
        vendinMachine = VendingMachine(coins: 10000)
        vendinMachine.append(drink: StroberryMilk(brand: "서울우유", capacity: 200, price: 2500, name: "딸기우유", create:"20210403", expire: "20210412", content: 1.0))
        vendinMachine.append(drink: ChocolateMilk(brand: "서울우유", capacity: 500, price: 1800, name: "초코우유", create: "20200211", expire: "20200220", content: 2.0))
        vendinMachine.append(drink: Georgia(brand: "스타벅스", capacity: 350, price: 3000, name: "조지아", create: "20210202", expire: "20210210", caffeine: 150, hot: true))
        vendinMachine.append(drink: Soda(brand: "팹시", capacity: 500, price: 3500, name: "제로콜라", create: "20200101", expire: "20200824", kind: .Coke))
    }

    func testGetBalance() {
        let coins = 10000
        vendinMachine.charge(coins: coins)
        let expect = 20000
        
        XCTAssertEqual(expect, vendinMachine.getbalance(), "잔액이 일치하지 않습니다.")
    }
    
    func testAvailableProducts(){
        
        let expect = 4
        let actual = vendinMachine.availableProducts().count
        
        XCTAssertEqual(expect, actual, "구매 가능한 음료 목록이 올바르지 않습니다.")
    }
    
    func testBuyProduct(){
        let georgia = Georgia(brand: "스타벅스", capacity: 350, price: 3000, name: "조지아", create: "20210202", expire: "20210210", caffeine: 150, hot: false)
        vendinMachine.buyProduct(drink: georgia)
        
        let expect = 3
        let actual = vendinMachine.getTotalStock().count
        XCTAssertEqual(expect, actual, "음료를 구매할 수 없습니다.")
    }
    func testExpiredProduct(){
        let actual = vendinMachine.expiredProduct().count
        let expect = 3
        
        XCTAssertEqual(expect, actual, "유통기한 체크 목록이 올바르지 않습니다.")
    }
    func testGetHotDrink(){
        let actual = vendinMachine.getHotDrink().count
        let expect = 1
        
        XCTAssertEqual(expect, actual, "뜨거운 음료 목록을 받아오지 못하였습니다.")
    }
    func testGetSoldProducts(){
        vendinMachine.charge(coins: 10000)
        
        vendinMachine.buyProduct(drink: StroberryMilk(brand: "서울우유", capacity: 200, price: 2500, name: "딸기우유", create:"20210403", expire: "20210412", content: 1.0))
        vendinMachine.buyProduct(drink: Georgia(brand: "스타벅스", capacity: 350, price: 3000, name: "조지아", create: "20210202", expire: "20210210", caffeine: 150, hot: true))
        vendinMachine.buyProduct(drink: Soda(brand: "팹시", capacity: 500, price: 3500, name: "제로콜라", create: "20200101", expire: "20200824", kind: .Coke))
        
        let expect = 3
        let actual = vendinMachine.getSoldProducts().count
        
        XCTAssertEqual(expect, actual, "구매 이력을 받아오지 못하였습니다.")
    }
}
