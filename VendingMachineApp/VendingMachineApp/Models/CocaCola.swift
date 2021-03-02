//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class CocaCola: Soda {
    enum Flavor: String {
        case Original = "Original Cola"
        case Cherry = "Cherry Cola"
        case Vanilla = "Vanilla Cola"
        
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
    
    init(date: Date, isZero: Bool, flavor: Flavor, expiration: Date, hot: Bool, calorie: Int) {
        self.flavor = flavor
        super.init(brand: "코카콜라", capacity: flavor.capacity(), price: flavor.price(), name: flavor.rawValue, date: date, isZero: isZero, expiration: expiration, hot: hot, calorie: calorie)
    }
}
