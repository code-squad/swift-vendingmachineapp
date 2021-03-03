//
//  MilkTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/26.
//

import XCTest
@testable import VendingMachineApp

class ModelTest: XCTestCase {

    func testEquatable(){
        let milk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: "20210202", expiredAt: "20210215", lowFat: true)
        let secondMilk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: "20200202", expiredAt: "20200215", lowFat: true)
        
        let expect : Bool = true
        let actual : Bool = (milk == secondMilk)
        XCTAssertEqual(expect, actual)
    }
    
    func testHashable(){
        let milk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: "20210202", expiredAt: "20210215", lowFat: true)
        let secondMilk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: "20200202", expiredAt: "20200215", lowFat: false)
        
        XCTAssertEqual(milk.hashValue, secondMilk.hashValue)
    }
    
    func testDictionaryKeyValue(){
        
        let milk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: "20210202", expiredAt: "20210215", lowFat: true)
        let secondMilk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: "20200202", expiredAt: "20200215", lowFat: true)
        
        var dict = [Beverage: Int]()
        
        dict[milk] = 1
        dict.updateValue(2, forKey: secondMilk)
        
        let expect = 2
        XCTAssertEqual(dict[milk], expect)
        
    }
}
