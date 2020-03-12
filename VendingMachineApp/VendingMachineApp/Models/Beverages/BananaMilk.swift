//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    let bananaContentGram: Int
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, farmCode: String, bananaContentGram: Int) {
        self.bananaContentGram = bananaContentGram
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, farmCode: farmCode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BananaMilk: Producible {
    static func produce(at manufactureDate: Date = Date()) -> Beverage {
        BananaMilk(name: "바나나는 원래 하얗다", brand: "매일우유", servingSize: 200, price: Money(1400), manufactureDate: manufactureDate, expirationDate: Date(timeInterval: 432000, since: manufactureDate), farmCode: "DJSN128", bananaContentGram: 30)
    }
}
