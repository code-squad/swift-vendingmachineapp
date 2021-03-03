//
//  ConsumerTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/27.
//

import XCTest
@testable import VendingMachineApp

class ConsumerTest: XCTestCase {

    var consumer : Consumer!
    var vendingMachine : VendingMachine!
    
    override func setUp() {
        vendingMachine = VendingMachine()
        vendingMachine.append(product: Georgia(createdAt: "20210228", expiredAt: "20210304"))
        consumer = Consumer(coins: 10000)
    }
    func testPutcoins(){
        let coin = 5000
        consumer.putCoinsToVendingMachine(with: coin)
        vendingMachine.charge(coins: coin)
        
        XCTAssertEqual(vendingMachine.getCoins(), coin, "돈이 자판기에 투입되지 않았습니다")
        XCTAssertEqual(consumer.coins, coin, "돈이 자판기에 투입되지 않았습니다")
        
    }
    /*
    func testBuy(){
        let actual = consumer.buy(with: "조지아오리지널", from: vendingMachine)
        
        XCTAssertTrue(actual, "음료수를 구매할 수 없습니다.")
    }
    
    func testTakeBalance(){
        let coin = 3000
        consumer.putCoinsToVendingMachine(with: coin) // consumer.coins = 7000
        vendingMachine.charge(coins: coin) // vending.coins = 3000
//        consumer.buy(with: "조지아오리지널", from: vendingMachine)
        consumer.takeBalance(from: vendingMachine) // consumer.coins = 90000, vendin.coins = 0
        
        let expect = 9000
        XCTAssertEqual(consumer.coins, expect, "돈을 회수하지 못하였습니다.")
        XCTAssertEqual(vendingMachine.getCoins(), 0, "돈을 회수하지 못하였습니다.")
    }
     */
}
