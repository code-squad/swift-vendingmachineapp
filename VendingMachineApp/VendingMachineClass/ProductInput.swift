//
//  ProductInput.swift
//  VendingMachineApp
//
//  Created by jang gukjin on 12/08/2019.
//  Copyright © 2019 jang gukjin. All rights reserved.
//

import Foundation

struct ProductInput {
    private var product: Product
    
    init(index: Int) {
        switch index {
        case 0: product = StrawberryMilk()
        case 1: product = ChocolateMilk()
        case 2: product = Coke()
        case 3: product = Sprite()
        case 4: product = TOPCoffee()
        default: product = CantataCoffee()
        }
    }
    
    func getProduct() -> Product{
        return product
    }
}
