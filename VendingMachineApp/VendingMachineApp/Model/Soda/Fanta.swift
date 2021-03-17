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
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, suger: Int, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, suger: suger)
    }

    required init() {
        flavor = .orange
        super.init(brand: "코카콜라", volume: 355, price: 800, name: "환타", createdAt: date, expiredAt: date, suger: 48)
    }
    
    required init?(coder decoder: NSCoder) {
        flavor = decoder.decodeObject(forKey: "flavor") as! Flavor
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(flavor, forKey: "flavor")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    // 개인취향과 일치하는 지 보는 함수
    func isFavorite(flavor: Flavor) -> Bool {
        return self.flavor == flavor
    }
}
