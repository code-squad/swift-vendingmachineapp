//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Sprite: Soda {
    enum Flavor: String {
        case Original = "오리지널 스프라이트"
        case Ginger = "진저 스프라이트"
        case Tropical = "트로피칼 스프라이트"
        
        func capacity() -> Int {
            switch self {
            case .Original:
                return 357
            case .Ginger:
                return 553
            case .Tropical:
                return 600
            }
        }
        
        func price() -> Int {
            switch self {
            case .Original:
                return 2500
            case .Ginger:
                return 2800
            case .Tropical:
                return 2850
            }
        }
    }
    
    private var flavor: Flavor
    
    init(date: Date, isZero: Bool, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: "스프라이트", capacity: flavor.capacity(), price: flavor.price(), name: flavor.rawValue, date: date, isZero: isZero)
    }
}
