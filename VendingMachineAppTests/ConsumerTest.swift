//
//  ConsumerTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/27.
//

import XCTest
@testable import VendingMachineApp

class ConsumerTest: XCTestCase {

    var customer : Customer!
    var vendingMachine : VendingMachine!
    var georgia : Georgia!
    
    override func setUp() {
        vendingMachine = VendingMachine()
        georgia = Georgia()
        vendingMachine.append(product: georgia)
    
        customer = Customer(coins: 10000)
    }
    func testPutcoins(){
        let coin = 5000
        customer.putCoinsToVendingMachine(with: coin)
        vendingMachine.charge(coins: coin)
        
        XCTAssertEqual(vendingMachine.getCoins(), coin, "돈이 자판기에 투입되지 않았습니다")
        XCTAssertEqual(customer.coins, coin, "돈이 자판기에 투입되지 않았습니다")
        
    }

    func testBuy(){
        let product = vendingMachine.sellProduct(product: georgia)

        XCTAssertNotNil(product, "음료수를 구매할 수 없습니다.")
    }
    
    func testPutCoinsToVendingMachine(){
        let coin = 3000
        
        customer.putCoinsToVendingMachine(with: coin) // consumer.coins = 7000
        vendingMachine.charge(coins: coin) // vending.coins = 3000
        
        let customerCoinGuess = 7000
        let machineCoinsGuess = 3000
        
        XCTAssertEqual(customer.coins, customerCoinGuess, "자판기에 돈을 넣지 않았습니다.")
        XCTAssertEqual(vendingMachine.getCoins(), machineCoinsGuess, "자판기에 돈이 들어가지 않았습니다.")
    }
    
    func testReturnBalance(){
        
        vendingMachine.charge(coins: 5000)
        customer.takeBalance(from: vendingMachine) 
        
        let expect = 15000
        XCTAssertEqual(customer.coins, expect, "돈을 회수하지 못하였습니다.")
        XCTAssertEqual(vendingMachine.getCoins(), 0, "돈을 반환하지 못하였습니다.")
    }
}
