//
//  Item.swift
//  VendingMachine
//
//  Created by CHOMINJI on 02/09/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Item {
    private var beverages: [Beverage]
    private var representBeverage: Beverage?
    
    init(beverages: [Beverage] = []) {
        self.beverages = beverages
    }
    
    var count: Int {
        return beverages.count
    }
    
    var isEmpty: Bool {
        return beverages.isEmpty
    }
    
    func append(beverage: Beverage, count: Int = 0) {
        let bundle = Array(repeating: beverage, count: count)
        beverages.append(contentsOf: bundle)
        representBeverage = beverage.self
    }
    
    func remove(beverage: Beverage) {
        if let index = beverages.firstIndex(of: beverage) {
            beverages.remove(at: index)
        }
    }
    
    func fetchFirst() -> Beverage? {
        return representBeverage
    }
    
    var info: ItemInfo? {
        guard let beverage = representBeverage else {
            return nil
        }
        let info = ItemInfo(name: beverage.itemName, price: beverage.itemPrice, count: count)
        return info
    }
}

// MARK: - Filter by conditions

extension Item {
    /// 재고를 조건에 따라 필터링한 결과를 리턴한다.
    func filter(by condition: Condition) -> [Beverage] {
        return beverages.filter { condition.filteringCommand($0) }
    }
    
    enum Condition {
        case all
        case hot
        case expired
        case purchasable(Int)
        
        var filteringCommand: (Beverage) -> Bool {
            switch self {
            case .all:
                return { _ in true }
            case .hot:
                return { $0.isHot }
            case .expired:
                return { $0.isExpired }
            case .purchasable(let balance):
                return { $0.itemPrice <= balance }
            }
        }
    }
}

// MARK: - ItemDTO

struct ItemInfo {
    let name: String
    let price: Int
    let count: Int
}
