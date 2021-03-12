//
//  EncondingBeverageTest.swift
//  VendingMachineappTests
//
//  Created by 심영민 on 2021/03/12.
//

import Foundation
import XCTest

@testable import VendingMachineapp

class EncondingBeverageTest: XCTestCase {
    var machine = VendingMachine()
    
    func testVendingMachine() {
        
        let archiveText = ArchivingManager.archive(with: machine.initializeProductList())
        print(archiveText)
        let archiveObject = ArchivingManager.unarchive(with: archiveText)
        var result = ""

        archiveObject?.forEach({
            result += $0.description + ", "
        })
        //XCTAssertEqual(result, "")
    }
}
