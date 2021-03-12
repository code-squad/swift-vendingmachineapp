//
//  BeverageMapper.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/08.
//

import Foundation

class BeverageMapper: NSObject, BeverageMapperable, NSCoding {
    
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
    
    func encode(with coder: NSCoder) {}
    
    required init?(coder: NSCoder) {
        self.map = coder.decodeObject(forKey: "beverageMapperMap") as! [Int: Beverage.Type]
        self.beverageTypes = coder.decodeObject(forKey: "beverageMapperBeverageTypes") as! [Beverage.Type]
    }
    
    
    func mapping(by tag: Int) -> Beverage.Type? {
        return map[tag]
    }
}

class MoneyMapper: NSObject, MoneyMapperable, NSCoding {
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
    
    func encode(with coder: NSCoder) {}
    
    required init?(coder: NSCoder) {
        self.map = coder.decodeObject(forKey: "moneyMapperMap") as! [Int: Money.Input]
        self.moneyInputTypes = coder.decodeObject(forKey: "beverageMapperMoneyInputTypes") as! [Money.Input]
    }
    
    func mapping(by tag: Int) -> Money.Input? {
        return map[tag]
    }
}
