//
//  BeverageMapper.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/08.
//

import Foundation

class BeverageMapper: BeverageMapperable {
    
    private let map: [Int: Beverage.Type]
    private let beverageTypes: [Beverage.Type]
    
    init(beverageTypes: [Beverage.Type]) {
        var map: [Int: Beverage.Type] = [:]
        self.beverageTypes = beverageTypes
        let tags = 0...beverageTypes.count
    
        for (tag, beverageType) in zip(tags, beverageTypes) {
            map[tag] = beverageType
        }
        
        self.map = map
    }
    
    func mapping(by tag: Int) -> Beverage.Type? {
        return map[tag]
    }
}

class MoneyMapper: MoneyMapperable {
    private let map: [Int: Money.Input]
    private let moneyInputTypes: [Money.Input]
    
    init(moneyInputTypes: [Money.Input]) {
        var map: [Int: Money.Input] = [:]
        self.moneyInputTypes = moneyInputTypes
        let tags = 0...moneyInputTypes.count
        
        for (tag, moneyInputType) in zip(tags, moneyInputTypes) {
            map[tag] = moneyInputType
        }
        
        self.map = map
    }
 
    func mapping(by tag: Int) -> Money.Input? {
        return map[tag]
    }
}
