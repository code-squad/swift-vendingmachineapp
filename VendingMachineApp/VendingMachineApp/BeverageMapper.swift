//
//  BeverageMapper.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/08.
//

import Foundation

struct BeverageMapper: BeverageMapperable {
    private let map: [Int: Beverage.Type]
    private let beverageTypes: [Beverage.Type] = [Banana.self, Strawberry.self,
                                                  TOP.self, Cantata.self,
                                                  Cola.self, Cider.self
                                                  ]
    
    init() {
        var map: [Int: Beverage.Type] = [:]
        let tags = 0...self.beverageTypes.count
    
        for (tag, beverageType) in zip(tags, beverageTypes) {
            map[tag] = beverageType
        }
        
        self.map = map
    }
    
    func mapping(by tag: Int) -> Beverage.Type? {
        return map[tag]
    }
}
