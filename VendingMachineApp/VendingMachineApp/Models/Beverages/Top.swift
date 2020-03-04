//
//  Top.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Top: Coffee {
    
    enum ContainerType {
        case cup
        case can
        case bottle
    }
    
    private(set) var containerType: ContainerType
    
    init(manufacturer: String = "동서식품",
         size: Int = 260,
         price: Int = 1200,
         name: String = "티.오.피",
         caffeineContent: Int = 30,
         temperature: Int = 4,
         containerType: ContainerType = .cup) {
        self.containerType = containerType
        super.init(manufacturer: manufacturer,
                   size: size, price: price,
                   name: name,
                   caffeineContent: caffeineContent,
                   temperature: temperature)
    }
}
