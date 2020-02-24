//
//  VendingMachineUnitTests.swift
//  VendingMachineUnitTests
//
//  Created by Cory Kim on 2020/02/24.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import XCTest
@testable import VendingMachineApp

class VendingMachineUnitTests: XCTestCase {
    
    let chocoMilk = ChocolateMilk(name: "서울우유 초코맛", brand: "서울우유", servingSize: 120, price: Money(1500), dateOfManufacture: Date(), farmCode: "AEKS1238", cacaoContentRate: 80)
    let bananaMilk = BananaMilk(name: "바나나는 원래 하얗다", brand: "매일우유", servingSize: 150, price: Money(1200), dateOfManufacture: Date(), farmCode: "AEKS1238", bananaContentGram: 20)
    let coke = Coke(name: "코카콜라 제로", brand: "코카콜라", servingSize: 550, price: Money(3500), dateOfManufacture: Date(), isSugarFree: true, packageColor: "Red")
    let sprite = Sprite(name: "펩시", brand: "PEPSI", servingSize: 120, price: Money(900), dateOfManufacture: Date(), isSugarFree: false, packageMaterial: "PET")
    let georgia = Georgia(name: "TOP아메리카노", brand: "TOP", servingSize: 180, price: Money(1500), dateOfManufacture: Date(), servingCaffeine: 140, isHotCoffee: false)
    let cantata = Cantata(name: "칸타타", brand: "칸타타", servingSize: 260, price: Money(2500), dateOfManufacture: Date(), servingCaffeine: 240, isCoffeeLatte: true)
    lazy var products = [chocoMilk, bananaMilk, coke, sprite, georgia, cantata]
    
    func testAddingToStock() {
        let vendingMachine: VendingMachine = VendingMachine(products: products)
        let sampleBeverages = [bananaMilk, sprite, georgia]
        sampleBeverages.forEach {
            vendingMachine.addToStock(beverage: $0)
        }
        sampleBeverages.forEach {
            XCTAssert(vendingMachine.numberOfBeverage($0) == 1)
        }
    }
    
    func testPuttingMoneyAndBuying() {
        var vendingMachine: VendingMachine = VendingMachine(products: products)
        let sampleBeverages = [bananaMilk, sprite, georgia]
        sampleBeverages.forEach {
            vendingMachine.addToStock(beverage: $0)
        }
        
        let bananaMilk = BananaMilk(name: "바나나는 원래 하얗다", brand: "매일우유", servingSize: 150, price: Money(1200), dateOfManufacture: Date(), farmCode: "AEKS38", bananaContentGram: 30)
        vendingMachine.putMoney(Money(1300))
        XCTAssert(vendingMachine.balance == Money(1300))
        XCTAssert(vendingMachine.numberOfBeverage(bananaMilk) == 1)
        
        XCTAssert(vendingMachine.availableBeverages().count == 2)
        
        vendingMachine.buy(bananaMilk)
        XCTAssert(vendingMachine.numberOfBeverage(bananaMilk) == 0)
        
        XCTAssert(vendingMachine.availableBeverages().count == 0)
        
        vendingMachine.putMoney(Money(10000))
        XCTAssert(vendingMachine.availableBeverages().count == 6)
    }
}
