//
//  VendingMachineAppTests.swift
//  VendingMachineAppTests
//
//  Created by Lia on 2021/03/04.
//

import XCTest

class VendingMachineAppTests: XCTestCase {
    
    private var vending: VendingMachine!
    private let newCantata = Cantata(brand: "롯데칠성", volume: 180, price: 1000, name: "칸타타", createdAt: Date.init(timeIntervalSinceNow: -10000), expiredAt: Date.init(timeIntervalSinceNow: 10000), caffeine: 80, design: .orange)
    
    override func setUp() {
        vending = VendingMachine()
    }

    override func tearDown() {
        
    }

    func testSenario() {
        
        // 1. 재고 추가 단계
        vending.add(item: StrawberryMilk())
        vending.add(item: ChocoMilk())
        vending.add(item: BananaMilk())
        vending.add(item: Fanta())
        vending.add(item: Cantata())
        vending.add(item: TOP())
        vending.add(item: newCantata)
        
        let SM = ObjectIdentifier(type(of:StrawberryMilk()))
        let CM = ObjectIdentifier(type(of:ChocoMilk()))
        let BM = ObjectIdentifier(type(of:BananaMilk()))
        let FS = ObjectIdentifier(type(of:Fanta()))
        let CC = ObjectIdentifier(type(of:Cantata()))
        let TC = ObjectIdentifier(type(of:TOP()))
        
        let addList = [SM:1, CM:1, BM:1, FS:1, CC:2, TC:1]
        XCTAssertEqual(vending.inventoryList(), addList, "재고 추가 완료")
        
        
        // 2. 돈 추가 단계
        vending.collectMoney(with: .coins)
        vending.collectMoney(with: .bill)
        
        XCTAssertEqual(vending.checkBalance(), 1500, "돈 추가 완료")
        
        
        // 3. 음료 구매
        vending.purchase(drink: ChocoMilk.self)
        
        let drinkList = [SM:1, BM:1, FS:1, CC:2, TC:1]
        XCTAssertEqual(vending.inventoryList(), drinkList, "(1) 재고 목록 완료")
        XCTAssertEqual(vending.checkBalance(), 900, "(2) 금액 감소 완료")
        XCTAssertEqual(vending.purchaseHistory(), [ChocoMilk()], "(3) 구매 내역 완료")
        
        
        // 4. 현재 금액으로 가능한 음료
        let availableList = [StrawberryMilk(), BananaMilk(), Fanta(), TOP()]
        XCTAssertEqual(vending.availableDrink(), availableList, "가능한 음료 완료")
        
        
        // 5. 유통기한 지난 음료
        // 유통기한 지난 칸타타 포함
        let expiredList = [StrawberryMilk(), BananaMilk(), Fanta(), Cantata(), TOP()]
        XCTAssertEqual(vending.expiredItems(), expiredList, "유통기한 지난 음료 완료")
        
        //삭제 후, 뉴 칸타타만 존재
        vending.purchase(drink: Cantata.self)
        let expiredList2 = [StrawberryMilk(), BananaMilk(), Fanta(), TOP()]
        XCTAssertEqual(vending.expiredItems(), expiredList2, "유통기한 지난 음료 완료")
        
        
        // 6. 카페인 함량 낮은 음료
        XCTAssertEqual(vending.lowCaffeine(), [TOP(), Cantata()], "카페인 낮은 음료 완료")
        
    }

}
