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
    
    var energyDrinkFactory : EnergyDrinkFactory!
    var coffeeFactory : CoffeeFactory!
    var sodaFactory : SodaFactory!
    var milkFactory : MilkFactory!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        
        energyDrinkFactory = EnergyDrinkFactory()
        coffeeFactory = CoffeeFactory()
        sodaFactory = SodaFactory()
        milkFactory = MilkFactory()
    }
    
    func testsSenario(){
        // 재고를 추가한다.
        vendingMachine.append(product: coffeeFactory.createBeverage(with: "Top"))
        vendingMachine.append(product: milkFactory.createBeverage(with: "Chocolate"))
        vendingMachine.append(product: coffeeFactory.createBeverage(with: "Georgia"))
        vendingMachine.append(product: sodaFactory.createBeverage(with: "Sprite"))
        
        // 잔액을 추가한다.
        vendingMachine.charge(coins: 10000)
        
        // 재고를 확인한다.
        vendingMachine.getTotalStock().forEach{print($0)}
        
        // 구매 가능한 상품을 출력한다.
        vendingMachine.availableProducts().forEach{print($0)}
        
        // 상품을 구매한다.
        vendingMachine.sellProduct(with: "조지아오리지널")
        
        // 잔액을 확인한다.
        let guess = 9000
        XCTAssertEqual(vendingMachine.getbalance(), guess, "잔액이 올바르지 않습니다.")
        
        // 재고 상태를 확인한다.
        vendingMachine.getTotalStock().forEach{print($0)}
        
        // 구매 이력을 확인한다.
        vendingMachine.getSoldProducts().forEach{print($0)}
    }
}
