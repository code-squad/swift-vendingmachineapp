//
//  Milk.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var expirationDate: Date = Date()

    override init(brand: String, name: String, volume: Int, price: Int, manufacturedDate: Date) {
        self.expirationDate = Calendar.current.date(byAdding: .day, value: 10, to: manufacturedDate) ?? Date()
        super.init(brand: brand, name: name, volume: volume, price: price,
                   manufacturedDate: manufacturedDate)
    }
    
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(self.expirationDate, forKey: "expirationDate")
        super.encode(with: aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let expirationDate = aDecoder.decodeObject(forKey: "expirationDate") as? Date else {
            return
        }
        self.expirationDate = expirationDate
    }

    func validate(with data: Date) -> Bool {
        return data < self.expirationDate
    }

    static func getKind() -> ObjectIdentifier {
        return ObjectIdentifier(self)
    }
}
