//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    enum Flavor: String {
        case Americano = "Americano"
        case Latte = "Premium Latte"
        case KaramelMacchiato = "Karamel Macchiato"
    }
    
    private var flavor: Flavor
    
    init(manufacturedDate: Date, caffein: Int, flavor: Flavor, hot: Bool, calorie: Int) {
        self.flavor = flavor
        super.init(brand: "Cantata", capacity: 275, price: Money(how: 1800), name: flavor.rawValue, manufacturedDate: manufacturedDate, caffein: caffein, expiration: Calendar.current.date(byAdding: .day, value: 60, to: manufacturedDate)!, hot: hot, calorie: calorie)
    }
    
    required init() {
        self.flavor = .Americano
        let manufacturedDate = Date()
        super.init(brand: "Cantata", capacity: 275, price: Money(how: 1800), name: flavor.rawValue, manufacturedDate: manufacturedDate, caffein: 5, expiration: Calendar.current.date(byAdding: .day, value: 60, to: manufacturedDate)!, hot: true, calorie: 25)    }
    
    required init?(coder: NSCoder) {
        self.flavor = coder.decodeObject(forKey: "cantataFlavor") as! Flavor
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(flavor, forKey: "cantataFlavor")
        super.encode(with: coder)
    }
}
