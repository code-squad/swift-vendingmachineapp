//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Sprite: Soda {
    let packageMaterial: String
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, isSugarFree: Bool, packageMaterial: String) {
        self.packageMaterial = packageMaterial
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, isSugarFree: isSugarFree)
    }
}

extension Sprite: Producible {
    static func produce(at manufactureDate: Date = Date()) -> Beverage {
        Sprite(name: "스프라이트", brand: "코카콜라", servingSize: 250, price: Money(2000), manufactureDate: manufactureDate, expirationDate: Date(timeInterval: 25920000, since: manufactureDate), isSugarFree: false, packageMaterial: "Aluminum")
    }
}
