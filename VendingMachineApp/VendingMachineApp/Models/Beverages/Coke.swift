//
//  Coke.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/21.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class Coke: Soda {
    let packageColor: String
    
    init(name: String, brand: String, servingSize: Int, price: Money, manufactureDate: Date, expirationDate: Date, isSugarFree: Bool, packageColor: String) {
        self.packageColor = packageColor
        super.init(name: name, brand: brand, servingSize: servingSize, price: price, manufactureDate: manufactureDate, expirationDate: expirationDate, isSugarFree: isSugarFree)
    }
    
    required init?(coder: NSCoder) {
        self.packageColor = coder.decodeObject(forKey: .packageColor) as? String ?? ""
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(object: packageColor, forKey: .packageColor)
    }
}

extension Coke: Producible {
    static var produce: ((Date) -> (Beverage)) = { manufactureDate in
        Coke(name: "코카콜라", brand: "코카콜라", servingSize: 140, price: Money(900), manufactureDate: manufactureDate, expirationDate: Date(timeInterval: 25920000, since: manufactureDate), isSugarFree: false, packageColor: "RED")
    }
}
