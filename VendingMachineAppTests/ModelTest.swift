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
        let milk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: Date(), expiredAt: Date().get7daysLatter(), lowFat: true)
        let secondMilk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: Date(), expiredAt: Date().get7daysLatter(), lowFat: true)
        
        let expect : Bool = true
        let actual : Bool = (milk == secondMilk)
        XCTAssertEqual(expect, actual)
    }
    
    func testDictionaryKeyValue(){
        
        let milk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: Date(), expiredAt: Date().get7daysLatter(), lowFat: true)
        let secondMilk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", createdAt: Date(), expiredAt: Date().get7daysLatter(), lowFat: true)
        
        var dict = [ObjectIdentifier: [Beverage]]()
        
        dict[ObjectIdentifier(type(of: Milk.self))] = [Beverage]()
        dict[ObjectIdentifier(type(of: Milk.self))]?.append(milk)
        dict[ObjectIdentifier(type(of: Milk.self))]?.append(secondMilk)

        
        let expect = 2
        let actual = dict[ObjectIdentifier(type(of: Milk.self))]?.count
        XCTAssertEqual(expect, actual)
        
    }
}
