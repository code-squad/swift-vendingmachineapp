//
//  ArchiveTest.swift
//  VendingMachineAppTests
//
//  Created by HOONHA CHOI on 2021/03/08.
//

import XCTest
@testable import VendingMachineApp

class ArchiveTest: XCTestCase {

    func testExample() throws {
        let vendingMachine = VendingMachine()
        vendingMachine.addStock(beverage: TopAmericano())
        vendingMachine.addStock(beverage: DietCola())
        vendingMachine.addStock(beverage: StrawberryMilk())

        
        let archive = ObjectArchive.archive(with: vendingMachine)
        guard let unArchive = ObjectArchive.unarchive(with: archive) else { return }
        
        XCTAssertEqual(ObjectIdentifier(type(of: vendingMachine)),
                       ObjectIdentifier(type(of: unArchive)))
    }
}
