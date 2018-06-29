//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Validate {
    
    private let brand: String
    private let volume: Int
    private let name: String
    private let expirationDate: Date
    var price: Int
    var kind: String {
        return "음료"
    }
    
    init(_ brand: String,_ volume: Int,_ price: Int,_ name: String,_ expirationDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.expirationDate = expirationDate
    }
    
    var description: String {
        let dateFormatter = DateUtility.formatDate("yyyyMMdd")
        return "\(kind) - \(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(dateFormatter.string(from: self.expirationDate))"
    }
    
   func isValidate(_ today: Date) -> Bool {
        return today < self.expirationDate
    }

}
