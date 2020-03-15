//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    let cacaoContentRate: Double
    let cacaoContentRateKey = "cacaoContentRate"
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date , farmCode: String, cacaoContentRate: Double) {
        self.cacaoContentRate = cacaoContentRate
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, farmCode: farmCode)
    }
    
    required init?(coder: NSCoder) {
        self.cacaoContentRate = coder.decodeDouble(forKey: .cacaoContentRate)
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(value: cacaoContentRate, forKey: .cacaoContentRate)
    }
}

extension ChocolateMilk: Producible {
    static var produce: ((Date) -> (Beverage)) = { manufactureDate in
        ChocolateMilk(name: "서울우유-초콜릿", brand: "서울우유", servingSize: 150, price: Money(1000), manufactureDate: manufactureDate, expirationDate: Date(timeInterval: 432000, since: manufactureDate), farmCode: "AEBN127", cacaoContentRate: 23.4)
    }
}
