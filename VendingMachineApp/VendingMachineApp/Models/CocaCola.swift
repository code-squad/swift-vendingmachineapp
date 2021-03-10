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
    }
    
    private var flavor: Flavor
    
    init(date: Date, isZero: Bool, flavor: Flavor, hot: Bool, calorie: Int) {
        self.flavor = flavor
        super.init(brand: "코카콜라", capacity: 333, price: Money(how: 2200), name: flavor.rawValue, date: Date(), expiration: Calendar.current.date(byAdding: .day, value: 90, to: date)!, hot: hot, calorie: calorie)
    }
}
