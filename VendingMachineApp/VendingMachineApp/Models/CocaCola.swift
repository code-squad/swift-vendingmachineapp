//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class CocaCola: Soda {
    enum Flavor: String {
        case Original = "오리지널 콜리"
        case Cherry = "체리맛 콜라"
        case Vanilla = "바닐라맛 콜라"
        
        func capacity() -> Int {
            switch self {
            case .Original:
                return 500
            case .Cherry:
                return 550
            case .Vanilla:
                return 600
            }
        }
        
        func price() -> Int {
            switch self {
            case .Original:
                return 2000
            case .Cherry:
                return 2500
            case .Vanilla:
                return 3000
            }
        }
    }
    
    private var flavor: Flavor
    
    init(date: Date, isZero: Bool, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: "코카콜라", capacity: flavor.capacity(), price: flavor.price(), name: flavor.rawValue, date: date, isZero: isZero)
    }
}
