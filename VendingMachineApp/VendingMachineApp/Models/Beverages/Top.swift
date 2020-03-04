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
    
    let containerType: ContainerType
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         caffeineContent: Int,
         temperature: Int,
         containerType: ContainerType) {
        self.containerType = containerType
        super.init(manufacturer: manufacturer,
                   size: size, price: price,
                   name: name,
                   caffeineContent: caffeineContent,
                   temperature: temperature)
    }
}
