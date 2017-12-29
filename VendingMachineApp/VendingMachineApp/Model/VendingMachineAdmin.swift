//
//  VendingMachineAdmin.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 18..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

struct VendingMachineAdmin {
    private var vendingMachine: VendingMachineProtocol

    init(vendingMachine: VendingMachineProtocol) {
        self.vendingMachine = vendingMachine
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    mutating func add(product: Beverage) {
        let category: Category = String(product.description.split(separator: "(")[0])
        vendingMachine.addProduct(category: category, product: product)
    }

    //    유통기한이 지난 재고만 리턴하는 메소드
    func getExpiredProducts(date: Date) -> Products {
        var result: Products = []
        vendingMachine.getInventory().filter { $0.key.hasSuffix("우유") }.forEach({ _, value in
            result.append(contentsOf: value.flatMap { $0 as? Milk }
                .filter { !$0.validate(with: date) }
                .map { $0 as Beverage })
        })
        print("check::: \(result)")
        return result
    }

    //    시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    func getSalesHistory() -> Products {
        return vendingMachine.getSalesHistory()
    }

    //    전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    func getInventory() -> Inventory {
        return vendingMachine.getInventory()
    }

    //    특정 상품 인스턴스를 넘겨서 재고를 제거하는 메소드
    func remove(product: Beverage) {
        let category: Category = String(product.description.split(separator: "(")[0])
        if let inventory = vendingMachine.getInventory()[category] {
            for i in 0..<inventory.count where inventory[i] == product {
                vendingMachine.remove(category: category, index: i)
            }
        }
    }

}
