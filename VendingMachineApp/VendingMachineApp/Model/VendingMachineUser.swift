//
//  VendingMachineUser.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 18..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct VendingMachineUser {
    private var vendingMachine: VendingMachineProtocol
    private(set) var purchaseList: Products = []

    init(vendingMachine: VendingMachineProtocol) {
        self.vendingMachine = vendingMachine
    }

    //    자판기 금액을 원하는 금액만큼 올리는 메소드
    func insertCoins(_ amount: Int) {
        vendingMachine.insertCoins(amount)
    }

    //    현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    func getBuyableProducts() -> [Category] {
        var result: [Category] = []
        for (key, value) in vendingMachine.getInventory() {
            let count = value.filter { $0.isBuyable(with: vendingMachine.getBalance()) }.count
            if count > 0 {
                result.append(key)
            }
        }
        return result
    }

    //    음료수를 구매하는 메소드
    mutating func buy(category: Category) {
        if vendingMachine.getInventory()[category] != nil {
            vendingMachine.buy(category: category)
            purchaseList.append(vendingMachine.getSalesHistory().last!)
        }
    }

    //    잔액을 확인하는 메소드
    func getBalance() -> Int {
        return vendingMachine.getBalance()
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getInventory() -> Inventory {
        return vendingMachine.getInventory()
    }

    //    따뜻한 음료만 리턴하는 메소드
    func getHotProducts() -> Products {
        var result: Products = []
        vendingMachine.getInventory().filter { $0.key.hasSuffix("커피") }.forEach({ _, value in
            result.append(contentsOf: value.flatMap { $0 as? Coffee }
                .filter { $0.isHot() }
                .map { $0 as Beverage })
        })
        return result
    }

}
