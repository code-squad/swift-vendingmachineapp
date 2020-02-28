//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class Sprite: Beverage {
    init() {
        super.init(manufacturer: "코카콜라", size: 250, price: 1200, name: "스프라이트")
    }
}
