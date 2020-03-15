//
//  Milk.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    private let expirationDate: Date
    
    init?(builder: Beverage.Builder,
          manufacturingDateInfo: String,
          expirationDateInfo: String) {
        guard let expirationDate = Date.dateFormatter.date(from: expirationDateInfo)
            else {
                return nil
        }
        self.expirationDate = expirationDate
        super.init(builder: builder,
                   manufacturingDateInfo: manufacturingDateInfo)
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
