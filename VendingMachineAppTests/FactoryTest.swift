//
//  FactoryTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/27.
//

import XCTest
@testable import VendingMachineApp

class FactoryTest: XCTestCase {
    
    func testEnergyDrinkFactory(){
        let monster = EnergyDrinkFactory.createBeverage(type : Monster.self)
        let hot6ix = EnergyDrinkFactory.createBeverage(type : Hot6ix.self)
        
        XCTAssertNotNil(monster, "Monster 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(hot6ix, "Hot6ix 객체를 생성하지 못했습니다.")
    }
    func testSodaFactory(){
        let sprite = SodaFactory.createBeverage(type: Sprite.self)
        let coke = SodaFactory.createBeverage(type: Coke.self)
        
        XCTAssertNotNil(sprite, "Sprite 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(coke, "Coke 객체를 생성하지 못했습니다.")
    }

    func testMilkFactory(){
        let chocolateMilk = MilkFactory.createBeverage(type: ChocolateMilk.self)
        let stroberryMilk = MilkFactory.createBeverage(type: StroberryMilk.self)
        let bananaMilk = MilkFactory.createBeverage(type: BananaMilk.self)
        
        XCTAssertNotNil(chocolateMilk, "ChocolateMilk 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(stroberryMilk, "StroberryMilk 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(bananaMilk, "BananaMilk 객체를 생성하지 못했습니다.")
    }
    
    func testCoffeeFactory(){
        let top = CoffeeFactory.createBeverage(type: Top.self)
        let cantata = CoffeeFactory.createBeverage(type: Cantata.self)
        let georgia = CoffeeFactory.createBeverage(type: Georgia.self)
        
        XCTAssertNotNil(top, "Top 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(cantata, "Cantata 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(georgia, "Georgia 객체를 생성하지 못했습니다.")
    }
}
