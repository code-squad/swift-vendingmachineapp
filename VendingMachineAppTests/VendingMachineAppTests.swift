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
        
        let top = Factory.createInstance(type: Top.self)!
        let chocoMilk = Factory.createInstance(type: ChocolateMilk.self)!
        let georgia = Factory.createInstance(type: Georgia.self)!
        
        var expectDict : [ObjectIdentifier : [Beverage]] = [
            ObjectIdentifier(Top.Type.self) : [top],
            ObjectIdentifier(ChocolateMilk.Type.self) : [chocoMilk],
            ObjectIdentifier(Georgia.Type.self) : [georgia],
        ]
        
        let expectList = [top,chocoMilk,georgia]
        
        // 재고를 추가한다.
        vendingMachine.append(product: top)
        vendingMachine.append(product: chocoMilk)
        vendingMachine.append(product: georgia)
        
        // 잔액을 추가한다.
        vendingMachine.charge(coins: 10000)
        
        // 재고를 확인한다.
        XCTAssertEqual(vendingMachine.getTotalStock().count, expectDict.count, "재고에 물품이 추가되지 않았습니다.")
        
        // 구매 가능한 상품을 출력한다.
        XCTAssertEqual(vendingMachine.availableProducts(), expectList, "구매 가능한 상품이 올바르지 않습니다.")
        
        // 상품을 구매한다.
        let prodcut = vendingMachine.getProduct(with: Georgia.self)!
        let bought = vendingMachine.purchase(with: prodcut)
        expectDict.removeValue(forKey: ObjectIdentifier(Georgia.Type.self))
        
        // 잔액을 확인한다.
        let guess = 9000
        XCTAssertEqual(vendingMachine.getCoins(), guess, "잔액이 올바르지 않습니다.")
        
        // 재고 상태를 확인한다.
        XCTAssertEqual(vendingMachine.getTotalStock().count, expectDict.count, "재고에 물품이 제거되지 않았습니다.")
        
        // 구매 이력을 확인한다.
        XCTAssertEqual(vendingMachine.getSoldProducts(), [georgia], "물품을 구매하지 못했습니다.")
    }
}
