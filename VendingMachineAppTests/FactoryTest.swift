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
        let monster = Factory.createInstance(type : Monster.self)
        let hot6ix = Factory.createInstance(type : Hot6ix.self)
        
        XCTAssertNotNil(monster, "Monster 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(hot6ix, "Hot6ix 객체를 생성하지 못했습니다.")
    }
    func testSodaFactory(){
        let sprite = Factory.createInstance(type: Sprite.self)
        let coke = Factory.createInstance(type: Coke.self)
        
        XCTAssertNotNil(sprite, "Sprite 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(coke, "Coke 객체를 생성하지 못했습니다.")
    }

    func testMilkFactory(){
        let chocolateMilk = Factory.createInstance(type: ChocolateMilk.self)
        let stroberryMilk = Factory.createInstance(type: StroberryMilk.self)
        let bananaMilk = Factory.createInstance(type: BananaMilk.self)
        
        XCTAssertNotNil(chocolateMilk, "ChocolateMilk 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(stroberryMilk, "StroberryMilk 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(bananaMilk, "BananaMilk 객체를 생성하지 못했습니다.")
    }
    
    func testCoffeeFactory(){
        let top = Factory.createInstance(type: Top.self)
        let cantata = Factory.createInstance(type: Cantata.self)
        let georgia = Factory.createInstance(type: Georgia.self)
        
        XCTAssertNotNil(top, "Top 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(cantata, "Cantata 객체를 생성하지 못했습니다.")
        XCTAssertNotNil(georgia, "Georgia 객체를 생성하지 못했습니다.")
    }
}
