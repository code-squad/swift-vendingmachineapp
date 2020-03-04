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
    
    private(set) var productType: ProductType
    
    init(manufacturer: String = "코카콜라",
         size: Int = 250,
         price: Int = 1300,
         name: String = "조지아 오리지널",
         caffeineContent: Int = 120,
         temperature: Int = 5,
         productType: ProductType = .americano) {
        self.productType = productType
        super.init(manufacturer: manufacturer,
                   size: size, price: price,
                   name: name,
                   caffeineContent: caffeineContent,
                   temperature: temperature)
    }
}
