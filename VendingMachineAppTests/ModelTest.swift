//
//  MilkTest.swift
//  VendingMachineAppTests
//
//  Created by 박혜원 on 2021/02/26.
//

import XCTest
@testable import VendingMachineApp

class ModelTest: XCTestCase {

    func testHashable(){
        let milk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", create: "20210202", expire: "20210215")
        let secondMilk = Milk(brand: "서울우유", capacity: 100, price: 2500, name: "초코", create: "20200202", expire: "20200215")
        
        let expect : Bool = true
        let actual : Bool = (milk == secondMilk)
        XCTAssertEqual(expect, actual)
    }
}
