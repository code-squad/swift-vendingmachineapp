//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    let isHotCoffee: Bool
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, servingCaffeine: Int, isHotCoffee: Bool) {
        self.isHotCoffee = isHotCoffee
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, servingCaffeine: servingCaffeine)
    }
    
    required init?(coder: NSCoder) {
        self.isHotCoffee = coder.decodeBool(forKey: .isHotCoffee)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(value: isHotCoffee, forKey: .isHotCoffee)
    }
    
    func isHot() -> Bool {
        return isHotCoffee
    }
}

extension Georgia: Producible {
    static var produce: ((Date) -> (Beverage)) = { manufactureDate in
        Georgia(name: "죠지아", brand: "죠지아", servingSize: 120, price: Money(900), manufactureDate: manufactureDate, expirationDate: Date(timeInterval: -500, since: manufactureDate), servingCaffeine: 80, isHotCoffee: false)
    }
}
