//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by joon-ho kil on 7/1/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import XCTest

class VendingMachineAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVendingMachineArchive() {
        let vendingMachine = VendingMachine.sharedInstance
        var vendingMachineToTest: VendingMachine
        
        vendingMachine.supply(1, amount: 1)
        vendingMachine.supply(2, amount: 2)
        
        saveVendingMachine(vendingMachine)
        vendingMachineToTest = loadVendingMachine() ?? VendingMachine.sharedInstance
    
        XCTAssertEqual(vendingMachineToTest.getStockList(),vendingMachine.getStockList())
        XCTAssertTrue("\(vendingMachine.getBalance())" == "\(vendingMachineToTest.getBalance())")
        XCTAssertEqual(vendingMachineToTest.getSellList(), vendingMachine.getSellList())
        
        vendingMachine.insertCoin(500)
        vendingMachine.insertCoin(1000)
        
        saveVendingMachine(vendingMachine)
        vendingMachineToTest = loadVendingMachine() ?? VendingMachine.sharedInstance
        
        XCTAssertEqual(vendingMachineToTest.getStockList(),vendingMachine.getStockList())
        XCTAssertTrue("\(vendingMachine.getBalance())" == "\(vendingMachineToTest.getBalance())")
        XCTAssertEqual(vendingMachineToTest.getSellList(), vendingMachine.getSellList())
    }

    /// 자판기 객체 저장
    private func saveVendingMachine (_ vendingMachine: VendingMachine) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(vendingMachine), forKey: "product")
    }

    /// 자판기 객체 불러오기
    private func loadVendingMachine () -> VendingMachine? {
        if let data = UserDefaults.standard.object(forKey: "product") as? Data {
            let vendingMachineToTest = try! PropertyListDecoder().decode(VendingMachine.self, from: data)
            
            return vendingMachineToTest
        }
        
        return nil
    }
}
