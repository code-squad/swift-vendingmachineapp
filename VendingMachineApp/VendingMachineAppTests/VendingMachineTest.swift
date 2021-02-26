import XCTest
@testable import VendingMachineApp

class VendingMachineTest: XCTestCase {
    var machine = VendingMachine()
    
    override func setUp() {
        machine.addBeverage(count: 6)
        machine.getTheMoney(from: 10000)
    }
    
    func testBalance() {
        XCTAssertEqual(machine.insertedMoney, 10000)
    }
    
    func testBuy() {
        machine.buyBeverage(productName: "초코에몽")
        XCTAssertEqual(machine.insertedMoney, 9000)
    }
}
