//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Song on 2021/02/26.
//

@testable import VendingMachineApp
import XCTest

class VendingMachineAppTests: XCTestCase {

    var vendingMachine: VendingMachine!
    
    let normal100 = Normal(brand: "평범", name: "평범한 음료", price: 100, size: 500, manufactured: Date())
    let expired200 = Expired(brand: "상함", name: "상한 음료", price: 200, size: 500, manufactured: Date())
    let notExpired200 = NotExpired(brand: "안상함", name: "안상한 음료", price: 200, size: 500, manufactured: Date())
    let bottled300 = Bottled(brand: "병", name: "병 음료", price: 300, size: 500, manufactured: Date())
    let notBottled300 = NotBottled(brand: "캔", name: "캔 음료", price: 300, size: 500, manufactured: Date())
    let hot400 = Hot(brand: "뜨거운", name: "뜨거운 음료", price: 400, size: 500, manufactured: Date())
    let notHot400 = NotHot(brand: "차가운", name: "차가운 음료", price: 400, size: 500, manufactured: Date())
    let healthy500 = Healthy(brand: "건강한", name: "건강한 음료", price: 500, size: 500, manufactured: Date())
    let partiallyHealthy500 = PartiallyHealthy(brand: "일부건강", name: "일부건강 음료", price: 500, size: 500, manufactured: Date())
    let expiredHot600 = ExpiredHot(brand: "상한 뜨거운", name: "상한 뜨거운 음료", price: 600, size: 500, manufactured: Date())
    
    var beverages: [Beverage]!
    
    override func setUp() {
        super.setUp()
        vendingMachine = VendingMachine()
        
        beverages = [normal100,
                     expired200, notExpired200,
                     bottled300, notBottled300,
                     hot400, notHot400,
                     healthy500, partiallyHealthy500,
                     expiredHot600]
        
        //재고를 추가한다
        beverages.forEach { (beverage) in
            vendingMachine.addStock(of: beverage)
        }
    }

    func test_is_vendingMachine() throws {
        
        //350원으로 살 수 있는 음료의 목록 확인
        vendingMachine.insert(money: 350)
        
        let result = [normal100, expired200, notExpired200, bottled300, notBottled300].sorted()
        XCTAssertEqual(vendingMachine.affordables().sorted(), result)
        
        //normal100 구매 후 잔액 체크
        vendingMachine.buy(beverage: normal100)
        
        let result2 = 250
        XCTAssertEqual(vendingMachine.moneyLeft(), result2)
        
        //250원으로 살 수 있는 제품 확인 (+normal100 재고 소진 확인)
        let result3 = [expired200, notExpired200].sorted()
        
        XCTAssertEqual(vendingMachine.affordables().sorted(), result3)
        
        //상한 재고 확인
        let result4 = [expired200: 1, expiredHot600: 1]
        XCTAssertEqual(vendingMachine.expiredItems().keys.sorted(), result4.keys.sorted())
        XCTAssertEqual(vendingMachine.expiredItems().values.sorted(), result4.values.sorted())
        
        //이동 가능한 제품 확인
        let result5 = [bottled300]
        XCTAssertEqual(vendingMachine.transportables(), result5)
        
        //재고 추가 후 전체 재고 확인
        vendingMachine.addStock(of: bottled300)
        vendingMachine.addStock(of: notHot400)
        
        let result6 = [expired200: 1, notExpired200: 1,
                       bottled300: 2, notBottled300: 1,
                       hot400: 1, notHot400: 2,
                       healthy500: 1, partiallyHealthy500: 1,
                       expiredHot600: 1]
        
        XCTAssertEqual(vendingMachine.allStocks().keys.sorted(), result6.keys.sorted())
        XCTAssertEqual(vendingMachine.allStocks().values.sorted(), result6.values.sorted())
    }
    
    override func tearDown() {
        vendingMachine = nil
        super.tearDown()
    }
}

//MARK: - Mocks
class Normal: Beverage { }

class Expired: Beverage, Expirable {
    func isExpired() -> Bool {
        return true
    }
}

class NotExpired: Beverage, Expirable {
    func isExpired() -> Bool {
        return false
    }
}

class Bottled: Beverage, Transportable {
    func isTransportable() -> Bool {
        return true
    }
}

class NotBottled: Beverage, Transportable {
    func isTransportable() -> Bool {
        return false
    }
}

class Hot: Beverage, Hotable {
    func isHotable() -> Bool {
        return true
    }
}

class NotHot: Beverage, Hotable {
    func isHotable() -> Bool {
        return false
    }
}

class Healthy: Beverage, SugarFreeable, LactoFreeable {
    func isSugarFree() -> Bool {
        return true
    }
    func isLactoFree() -> Bool {
        return true
    }
}

class PartiallyHealthy: Beverage, SugarFreeable, LactoFreeable {
    func isSugarFree() -> Bool {
        return false
    }
    func isLactoFree() -> Bool {
        return true
    }
}

class ExpiredHot: Beverage, Expirable, Hotable {
    func isExpired() -> Bool {
        return true
    }
    
    func isHotable() -> Bool {
        return true
    }
}
