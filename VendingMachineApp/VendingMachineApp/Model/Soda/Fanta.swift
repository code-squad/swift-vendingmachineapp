//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Fanta: Soda {
    enum Flavor {
        case pineapple
        case orange
        case grape
    }

    private let flavor: Flavor
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, sugarPercent: Int, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, sugarPercent: sugarPercent)
    }
    
    convenience init() {
        self.init(brand: "코카콜라", volume: 355, price: 800, name: "환타", createdAt: date, expiredAt: date, sugarPercent: 6, flavor: .grape)
    }
    
    // 자판기 주인의 개인취향과 일치하는 지 보는 함수
    func isFavorite() -> Bool {
        return flavor == .grape
    }
}
