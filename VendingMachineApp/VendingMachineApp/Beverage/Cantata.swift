//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/01.
//

import Foundation

class Cantata: Coffee {
    init() {
        super.init(brand: "롯데", volume: 350, price: 2000, name: "콘트라베이스 콜드브루", manufacturedAt: Date(), isDecaffein: false)
    }
}
