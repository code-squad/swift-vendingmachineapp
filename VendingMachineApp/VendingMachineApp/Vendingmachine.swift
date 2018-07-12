//
//  Vendingmachine.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Vendingmachine: AdminVendingmachine, UserVendingmachine, Codable {

    private var balance: Int = 0
    private var inventory: [String: [Beverage]] = [:]
    private var purchases: [Beverage] = []
    static var shareInstance: Vendingmachine?

    init(_ beverageSet: [Beverage]) {
        for item in beverageSet {
            addPurchases(item)
        }
    }
    
    subscript(item: String) -> [Beverage]? {
        return self.inventory[item]
    }
    
    /* 사용자 */
    
    //자판기 금액을 원하는 금액만큼 올리는 메소드
    func addBalance(_ inputMoney: Int) {
        self.balance += inputMoney
    }

    //특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    func addPurchases(_ beverage: Beverage) {
        self.inventory[beverage.kind, default: []].append(beverage)
    }
    
    //현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func buyableOfList() -> [String] {
        return self.inventory.filter({$0.value.count > 0}).filter({($0.value[0].price) <= self.balance}).map({$0.key})
    }
    
    //음료수를 구매하는 메소드
    func buyBeverage(_ beverage: String) {
        let soldBeverage = self.inventory[beverage]?.removeFirst()
        guard let beverage = soldBeverage else { return }
        self.purchases.append(beverage)
        let price = beverage.price
        self.balance -= price
    }
    
    //잔액을 확인하는 메소드
    func checkBalance() -> Int {
        return self.balance
    }

    //전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func checkInventory() -> [String: [Beverage]] {
        return self.inventory.filter({$0.value.count > 0})
    }

    //유통기한이 지난 재고만 리턴하는 메소드
    func checkInvalid() -> [Beverage] {
        var invalidBeverages: [Beverage] = []
        for beverages in self.inventory.values {
            invalidBeverages += beverages.filter({$0.isValidate(Date())})
        }
        return invalidBeverages
    }

    //따뜻한 음료만 리턴하는 메소드
    func checkHotBeverage() -> [Beverage] {
        var hotBeverages: [Beverage] = []
        for beverages in self.inventory.values {
            let coffee = beverages.compactMap({$0 as? Coffee}).filter({$0.isHot()})
            hotBeverages.append(contentsOf: coffee)
        }
        return hotBeverages
    }

    //시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func checkPurchases() -> [Beverage] {
        return self.purchases
    }
    
    //특정 음료의 재고를 리턴하는 메소드
    func countOfInventory(_ kind: String) -> Int {
        return inventory[kind]?.count ?? 0
    }
    
    //음료의 가격을 리턴하는 메소드
    func makePriceOfBeverage(_ kind: String) -> Int {
        guard let price = self.inventory[kind]?.first?.price else {
            return 0
        }
        return price
    }

    //음료의 종류를 리턴하는 메소드
    func makeKindOfBeverage() -> [String] {
        var kind: [String] = []
        for item in self.inventory.values {
            kind.append(item.first?.kind ?? "")
        }
        return kind
    }
    
    /* 관리자 */
    //재고를 삭제하는 메소드
    func removeInventory(_ beverage: String) {
        self.inventory[beverage]?.removeFirst()
    }

}

protocol AdminVendingmachine {
    func removeInventory(_ beverage: String)
    func makeKindOfBeverage() -> [String]
    func addPurchases(_ beverage: Beverage)
    subscript(item: String) -> [Beverage]? { get }
}

protocol UserVendingmachine {
    func addBalance(_ inputMoney: Int)
    func addPurchases(_ beverage: Beverage)
    func buyableOfList() -> [String]
    func buyBeverage(_ beverage: String)
    func checkBalance() -> Int
    func checkPurchases() -> [Beverage]
    func makePriceOfBeverage(_ kind: String) -> Int
    func makeKindOfBeverage() -> [String]
    subscript(item: String) -> [Beverage]? { get }
}

