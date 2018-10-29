//
//  Stocks.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Stocks {
    private var list: [Beverage]
    var bundles: Bundles {
        let bundles = Dictionary(grouping: list, by: { $0.className }).values.map { $0 }
        return Bundles(bundles.map {Bundle(list: $0)})
    }
    
    var expired: [Beverage] {
        return list.filter { !$0.isValidate() }
    }
    
    init(_ list: [Beverage]) {
        self.list = list
    }
    
    func append(_ beverage: Beverage) {
        list.append(beverage)
    }
    
    // 현재 잔액으로 구매할 수 있는 음료 목록
    func availables(with money: Int) -> [Beverage] {
        return list.filter { $0.isPurchasable(with: money) != nil }
    }
    
    // 음료수 구매 메소드
    func buy(at item: Beverage, _ account: Int) throws -> Int {
        try remove(at: item)
        guard let price = item.isPurchasable(with: account) else { throw VendingMachineError.outOfBudget }
        return price
    }
    
    func remove(at item: Beverage) throws {
        guard let index = list.firstIndex(of: item) else { throw VendingMachineError.outOfStock }
        list.remove(at: index)
    }
}
