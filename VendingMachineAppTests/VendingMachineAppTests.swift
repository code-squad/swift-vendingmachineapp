//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/25.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineAppTests: XCTestCase {
    
    var vendingMachine : VendingMachine!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
    }
    
    func testsSenario(){
        // 재고를 추가한다.
        vendingMachine.append(product: CoffeeFactory.createBeverage(type: Top.self)!)
        vendingMachine.append(product: MilkFactory.createBeverage(type: ChocolateMilk.self)!)
        let georgia = CoffeeFactory.createBeverage(type: Georgia.self)!
        vendingMachine.append(product: georgia)
        vendingMachine.append(product: SodaFactory.createBeverage(type: Sprite.self)!)
        
        // 잔액을 추가한다.
        vendingMachine.charge(coins: 10000)
        
        // 재고를 확인한다.
//        vendingMachine.getTotalStock().forEach{print($0)}
        
        // 구매 가능한 상품을 출력한다.
        vendingMachine.availableProducts().forEach{print($0)}
        
        // 상품을 구매한다.
        vendingMachine.sellProduct(product: georgia)
        
        // 잔액을 확인한다.
        let guess = 9000
        XCTAssertEqual(vendingMachine.getCoins(), guess, "잔액이 올바르지 않습니다.")
        
        // 재고 상태를 확인한다.
//        vendingMachine.getTotalStock().forEach{print($0)}
        
        // 구매 이력을 확인한다.
        vendingMachine.getSoldProducts().forEach{print($0)}
    }
}
