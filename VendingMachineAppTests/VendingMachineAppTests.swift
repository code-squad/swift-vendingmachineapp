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
        vendinMachine.append(drink: StroberryMilk(create:"20210403", expire: "20210412"))
        vendinMachine.append(drink: ChocolateMilk(create: "20200211", expire: "20200220"))
        vendinMachine.append(drink: Georgia(create :"20210202", expire: "20210210", hot: true))
        vendinMachine.append(drink: Coke(create: "20200101", expire: "20200824", flaver: .cherry))

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
        let georgia = Georgia(create: "20210202", expire: "20210210")
        vendinMachine.buyProduct(product: georgia)
        
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
    
        vendinMachine.buyProduct(product: StroberryMilk(create:"20210403", expire: "20210412"))
        let expect = 1
        let actual = vendinMachine.getSoldProducts().count
        
        XCTAssertEqual(expect, actual, "구매 이력을 받아오지 못하였습니다.")
    }
}
