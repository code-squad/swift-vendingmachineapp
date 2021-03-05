//
//  VendingMachine.swift
//  Test
//
//  Created by Jun Ho JANG on 2021/03/03.
//

import XCTest
@testable import VendingMachineApp

<<<<<<< HEAD
class VendingMachineTest: XCTestCase {
=======
class test: XCTestCase {
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
    
    var vendingMachine: VendingMachine!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
    }
<<<<<<< HEAD
    
    
    
    // 현금 투입
    func testAddCash_Success() {
        let cash = 100
        vendingMachine.addCash(cash: cash)
        let expectation = 100
        
        XCTAssertEqual(expectation, vendingMachine.showAccount(), "Panther")
    }
    
    
    
    // 앞서 VendingMachine에서 현금 투입 두 번째 함수와 관련이 있습니다.
    // 인스턴스 호출, 객체에게 명령하고 수행하도록 하는 것에 대한 이해가 부족했는데,
    // VendingMachine에서 addCash 함수와 insertCash 함수를 통해 제대로 이해한 것이 맞는지 확인하고 싶었습니다.
    // 위에 testAddCash_Success가 Vending Machine 객체에게 현금을 추가하도록 명령하고
    // Vending Machine은 스스로 가지고 있는, 캡술화된 account에 직접 현금을 추가하는 것으로 이해해도 괜찮은지 여쭤보고 싶었습니다.
    func testInsertCash_Fail() {
        let cash = 100
        let result = vendingMachine.insertCash(cash: cash)
        
        XCTAssertEqual(result, vendingMachine.showAccount(), "Panther")
    }
    
    
    
    // 현금 2회 투입
    func testAddCashTwice_Success() {
        let cash = 100
        vendingMachine.addCash(cash: cash)
        let secondCash = 100
        vendingMachine.addCash(cash: secondCash)
        let expectation = 200
        
        XCTAssertEqual(expectation, vendingMachine.showAccount(), "Panther")
    }
    
    
    
    // 음료 추가
    func testAddBeverage_Success() {
        let target1 = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date())
        if let cantataLatte = target1 {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        let expectation = [target1]
        
        XCTAssertEqual(expectation, vendingMachine.showInventory(), "Panther")
    }
    
    
    
    // 금액 5000원 추가 후 5000원으로 구매할 수 있는 SKU만 확인
    func testShowPurchasble_Success() {
        
        vendingMachine.addCash(cash: 5000)
        
        let target1 = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date())
        if let cantataLatte = target1 {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        
        let target2 = BeverageFactory.addBeverage(type: SeoulStrawberry.self, manufacturedAt: Date(), expiration: Date())
        if let seoulStrawberry = target2 {
            vendingMachine.addBeverage(beverage: seoulStrawberry)
        }
        
        let target3 = BeverageFactory.addBeverage(type: BlueBottle.self, manufacturedAt: Date(), expiration: Date())
        if let blueBottle = target3 {
            vendingMachine.addBeverage(beverage: blueBottle)
        }
        
        let expectation = [target1, target2]
        
        XCTAssertEqual(expectation, vendingMachine.showPurchasable(), "Panther")
    }
    
    
    
    // 재고에서 특정 음료 제거
    func testRemoveOneBeverage_Success() {
        
        let target1 = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date())
        if let cantataLatte = target1 {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        
        let target2 = BeverageFactory.addBeverage(type: SeoulStrawberry.self, manufacturedAt: Date(), expiration: Date())
        if let seoulStrawberry = target2 {
            vendingMachine.addBeverage(beverage: seoulStrawberry)
        }
        
        let target3 = BeverageFactory.addBeverage(type: BlueBottle.self, manufacturedAt: Date(), expiration: Date())
        if let blueBottle = target3 {
            vendingMachine.addBeverage(beverage: blueBottle)
        }
        
        let expectation = [target1, target3]
        
        vendingMachine.remove(one: target2!)
        
        XCTAssertEqual(expectation, vendingMachine.showInventory(), "Panther")
    }
    
    
    
    // 재고에서 특정 음료 판매
    func testSellOneBeverage_Success() {
        
        let target1 = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date())
        if let cantataLatte = target1 {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        
        let target2 = BeverageFactory.addBeverage(type: SeoulStrawberry.self, manufacturedAt: Date(), expiration: Date())
        if let seoulStrawberry = target2 {
            vendingMachine.addBeverage(beverage: seoulStrawberry)
        }
        
        let target3 = BeverageFactory.addBeverage(type: BlueBottle.self, manufacturedAt: Date(), expiration: Date())
        if let blueBottle = target3 {
            vendingMachine.addBeverage(beverage: blueBottle)
        }
        
        let expectation1 = [target1, target3]
        
        // 판매 후 제거 확인
        vendingMachine.sell(one: target2!)
        XCTAssertEqual(expectation1, vendingMachine.showInventory(), "Panther")
        
        // 구매이력을 통한 구매 확인
        let expectation2 = [target2]
        XCTAssertEqual(expectation2, vendingMachine.showHistory(), "Panther")
    }
    
    
    
    func testShowAccount_Success() {
        XCTAssertEqual(0, vendingMachine.showAccount(), "Panther")
    }
    
    
    
    func testShowInventory_Success() {
        XCTAssertEqual([Beverage](), vendingMachine.showInventory(), "Panther")
    }
    
    
    
    // 유통기한 만료 SKU만 확인
    func testShowExpired_Success() {
        
        let target = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date().stringToDate(date: "2020-02-20"))
        if let cantataLatte = target {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        
        XCTAssertEqual(false, vendingMachine.showInventory()[0].isNotExpired(), "Panther")
    }
    
    
    
    // 뜨거운 음료만 확인
    func testFindHotBeverage_Success() {
        
        let target1 = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date())
        if let cantataLatte = target1 {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        
        let target2 = BeverageFactory.addBeverage(type: SeoulStrawberry.self, manufacturedAt: Date(), expiration: Date())
        if let seoulStrawberry = target2 {
            vendingMachine.addBeverage(beverage: seoulStrawberry)
        }
        
        let target3 = BeverageFactory.addBeverage(type: BlueBottle.self, manufacturedAt: Date(), expiration: Date())
        if let blueBottle = target3 {
            vendingMachine.addBeverage(beverage: blueBottle)
        }
        
        let expectation = [target1]
        
        XCTAssertEqual(expectation, vendingMachine.hotBeverage(), "Panther")
    }
    
    
    
    // 제품 2개 구입
    func testSellTwoBeverage_Success() {
        
        let target1 = BeverageFactory.addBeverage(type: CantataLatte.self, manufacturedAt: Date(), expiration: Date())
        if let cantataLatte = target1 {
            vendingMachine.addBeverage(beverage: cantataLatte)
        }
        
        let target2 = BeverageFactory.addBeverage(type: SeoulStrawberry.self, manufacturedAt: Date(), expiration: Date())
        if let seoulStrawberry = target2 {
            vendingMachine.addBeverage(beverage: seoulStrawberry)
        }
        
        let target3 = BeverageFactory.addBeverage(type: BlueBottle.self, manufacturedAt: Date(), expiration: Date())
        if let blueBottle = target3 {
            vendingMachine.addBeverage(beverage: blueBottle)
        }
        
        vendingMachine.sell(one: target2!)
        vendingMachine.sell(one: target3!)
        
        let expectation1 = [target2, target3]
        
        XCTAssertEqual(expectation1, vendingMachine.showHistory(), "Panther")
        
        let expectation2 = [target1]
        
        XCTAssertEqual(expectation2, vendingMachine.showInventory(), "Panther")
    }
    
=======

    func testExample() {
        let cash = 100
        vendingMachine.insertCash(cash: cash)
        let expect = 100
        XCTAssertEqual(expect, vendingMachine.showAccount(), "not equal")
    }

>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
}
