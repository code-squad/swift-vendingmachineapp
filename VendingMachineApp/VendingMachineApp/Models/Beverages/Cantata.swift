//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    let isCoffeeLatte: Bool
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, servingCaffeine: Int, isCoffeeLatte: Bool) {
        self.isCoffeeLatte = isCoffeeLatte
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, servingCaffeine: servingCaffeine)
    }
    
    required init?(coder: NSCoder) {
        self.isCoffeeLatte = coder.decodeBool(forKey: .isCoffeeLatte)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(value: isCoffeeLatte, forKey: .isCoffeeLatte)
    }
    
    func isLatte() -> Bool {
        return isCoffeeLatte
    }
}

extension Cantata: Producible {
    static var produce: ((Date) -> (Beverage)) = { manufactureDate in
        Cantata(name: "칸타타", brand: "칸타타", servingSize: 180, price: Money(950), manufactureDate: manufactureDate, expirationDate: Date(timeInterval: 25920000, since: manufactureDate), servingCaffeine: 80, isCoffeeLatte: false)
    }
}
