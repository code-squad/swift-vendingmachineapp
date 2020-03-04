//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Georgia: Coffee {
    
    enum ProductType {
        case original
        case caffeLatte
        case americano
    }
    
    let productType: ProductType
    
    init(manufacturer: String,
         size: Int,
         price: Int,
         name: String,
         caffeineContent: Int,
         temperature: Int,
         productType: ProductType) {
        self.productType = productType
        super.init(manufacturer: manufacturer,
                   size: size, price: price,
                   name: name,
                   caffeineContent: caffeineContent,
                   temperature: temperature)
    }
}
