//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Sprite: Soda {
    override init() {
        super.init(name: DefaultData.sprite.name, price: DefaultData.sprite.price)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
