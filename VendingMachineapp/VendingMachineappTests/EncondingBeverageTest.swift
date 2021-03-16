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
        
        let archiveText = ArchivingManager.archive(with: machine)
        print(archiveText)
        let archiveObject = ArchivingManager.unarchive()
        var result = ""

        
        //XCTAssertEqual(result, "")
    }
}
