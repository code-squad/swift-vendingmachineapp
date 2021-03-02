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
        vendingMachine.append(product: StroberryMilk(createdAt:"20210403", expiredAt: "20210412"))
        vendingMachine.append(product: ChocolateMilk(createdAt: "20200211", expiredAt: "20200220"))
        vendingMachine.append(product: Coke(createdAt: "20200101", expiredAt: "20200824"))
        vendingMachine.append(product: Top(createdAt: "20210101", expiredAt: "20210101", hot: true))
    }

    func testGetBalance() {
        let coins = 10000
        vendingMachine.charge(coins: coins)
        let expect = 20000
        
        XCTAssertEqual(expect, vendingMachine.getbalance(), "잔액이 일치하지 않습니다.")
    }
    
    func testAvailableProducts(){
        
        let expect = 4
        let actual = vendingMachine.availableProducts().count
        
        XCTAssertEqual(expect, actual, "구매 가능한 음료 목록이 올바르지 않습니다.")
    }
    
    func testSellProduct(){
        let georgia = Georgia(createdAt :"20210202", expiredAt: "20210210")
        vendingMachine.append(product: georgia)
        
        let expect = georgia
        let actual = vendingMachine.sellProduct(with: "조지아오리지널")
        
        XCTAssertEqual(expect, actual, "음료를 구매할 수 없습니다.")
    }
    func testExpiredProduct(){
        let actual = vendingMachine.expiredProduct().count
        let expect = 3
        
        XCTAssertEqual(expect, actual, "유통기한 체크 목록이 올바르지 않습니다.")
    }
    func testGetHotDrink(){
        
        let actual = vendingMachine.getHotDrink().count
        let expect = 1
        
        XCTAssertEqual(expect, actual, "뜨거운 음료 목록을 받아오지 못하였습니다.")
    }
    func testGetSoldProducts(){
    
        vendingMachine.sellProduct(with: "초코맛 우유")
        let expect = 1
        let actual = vendingMachine.getSoldProducts().count
        
        XCTAssertEqual(expect, actual, "구매 이력을 받아오지 못하였습니다.")
    }
}
