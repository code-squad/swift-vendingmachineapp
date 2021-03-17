//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by 지북 on 2021/03/02.
//

import XCTest

class VendingMachineAppTests: XCTestCase {
    var vendingMachine = VendingMachine()
    
    override func setUpWithError() throws {
        vendingMachine = VendingMachine()
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func testArchived() throws {
        vendingMachine.append(StrawberryMilk())
        vendingMachine.append(Sprite())
        
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false) else {
            XCTAssert(false, "vendingMachine Archived 실패")
            return
        }
        guard let vendingMachine2 = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? VendingMachine else {
            XCTAssert(false, "vendingMachine UnArchived 실패")
            return
        }
        XCTAssertEqual(vendingMachine, vendingMachine2)
    }
    
    func testAnyClassArchived() throws {
        let testClass = ChocoMilk()
        
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: testClass, requiringSecureCoding: false) else {
            XCTAssert(false, "Archived 실패")
            return
        }
        guard let testClass2 = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? ChocoMilk else {
            XCTAssert(false, "UnArchived 실패")
            return
        }
        XCTAssertEqual(testClass, testClass2)
    }
    

}
