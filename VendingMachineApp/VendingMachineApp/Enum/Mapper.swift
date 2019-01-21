//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 2..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

struct Mapper {
    
    //MARK: - Properties
    //MARK: Singleton Object
    
    static let shared = Mapper()
    
    //MARK: Private
    
    private let map: [Int: Beverage.Type]
    private let reverseMap: [ObjectIdentifier: Int]
    private let imageMap: [ObjectIdentifier: String] = [ObjectIdentifier(MandarineMilk.self): "CocaCola.png",
                                                        ObjectIdentifier(LactoseFreeMilk.self): "LactoseFreeMilk.png",
                                                        ObjectIdentifier(StarbucksDoubleShot.self): "StarbucksDoubleShot.png",
                                                        ObjectIdentifier(TOPTheBlack.self): "TOPTheBlack.png",
                                                        ObjectIdentifier(CocaCola.self): "CocaCola.png",
                                                        ObjectIdentifier(CocaColaZero.self): "CocaColaZero.png",]
    
    //MARK: Initialization
    
    private init() {
        
        var map: [Int: Beverage.Type] = [:]
        var reverseMap: [ObjectIdentifier: Int] = [:]
        let tag = 1...Int.max
        let BeverageTypes: [Beverage.Type] = [MandarineMilk.self,
                                              LactoseFreeMilk.self,
                                              StarbucksDoubleShot.self,
                                              TOPTheBlack.self,
                                              CocaCola.self,
                                              CocaColaZero.self,]
        
        for (tag, beverageType) in zip(tag, BeverageTypes) {
            map[tag] = beverageType
            reverseMap[ObjectIdentifier(beverageType)] = tag
        }
        
        self.map = map
        self.reverseMap = reverseMap
    }
    
    //MARK: - Methods
    
    func mapping(by tag: Int) -> Beverage.Type? {
        return map[tag]
    }
    
    func mapping(by beverageType: Beverage.Type) -> Int? {
        return reverseMap[ObjectIdentifier(beverageType)]
    }
    
    func imageMapping(by beverageType: Beverage.Type) -> String? {
        return imageMap[ObjectIdentifier(beverageType)]
    }
}
