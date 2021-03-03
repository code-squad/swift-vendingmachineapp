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
        
        let top = CoffeeFactory.createBeverage(type: Top.self)!
        let chocoMilk = MilkFactory.createBeverage(type: ChocolateMilk.self)!
        let georgia = CoffeeFactory.createBeverage(type: Georgia.self)!
        let sprite = SodaFactory.createBeverage(type: Sprite.self)!
        
        var list = [top,chocoMilk,georgia,sprite]
        
        // 재고를 추가한다.
        vendingMachine.append(product: top)
        vendingMachine.append(product: chocoMilk)
        vendingMachine.append(product: georgia)
        vendingMachine.append(product: sprite)
        
        // 잔액을 추가한다.
        vendingMachine.charge(coins: 10000)
        
        // 재고를 확인한다.
        XCTAssertEqual(vendingMachine.getTotalStock(), list.toDictionary(with: {$0.self}), "재고에 물품이 추가되지 않았습니다.")
        
        // 구매 가능한 상품을 출력한다.
        XCTAssertEqual(vendingMachine.availableProducts(), list, "구매 가능한 상품이 올바르지 않습니다.")
        
        // 상품을 구매한다.
        vendingMachine.sellProduct(product: georgia)
        list.remove(at: 2)
        
        // 잔액을 확인한다.
        let guess = 9000
        XCTAssertEqual(vendingMachine.getCoins(), guess, "잔액이 올바르지 않습니다.")
        
        // 재고 상태를 확인한다.
        XCTAssertEqual(vendingMachine.getTotalStock(), list.toDictionary(with: {$0.self}), "재고에 물품이 제거되지 않았습니다.")
        
        // 구매 이력을 확인한다.
        XCTAssertEqual(vendingMachine.getSoldProducts(), [georgia], "물품을 구매하지 못했습니다.")
    }
}
