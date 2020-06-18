//
//  Milk.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var expirationDate: Date!
    
    override init(brand: String,
         name: String,
         volume: Int,
         price: Int
    ) {
        super.init(
            brand: brand,
            name: name,
            volume: volume,
            price: price
        )
        let oneWeekTime = TimeInterval(604800)
        self.expirationDate = manufacturingDate.addingTimeInterval(oneWeekTime)
    }
    
    func validate(with date:Date) -> Bool {
        return date < expirationDate
    }
}

extension Milk {
    override var description: String {
        return super.description + ", \(expirationDate.toStringYearMonthDay)"
    }
}
