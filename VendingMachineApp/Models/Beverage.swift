//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

class Beverage : CustomStringConvertible {
    var brand : String
    var capacity :  Int
    var price : Int
    var name : String
    var createDate : Date
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(Date.toString(date : createDate))"
    }
    init(brand : String, capacity : Int, price : Int, name : String, createDate : String){
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.createDate = Date.getDate(with: createDate)
    }
}

extension Date {
    static func getDate(with str : String) -> Date{
        let dateFormatter = setDateFormat(with: "yyyyMMdd")
        let date = dateFormatter.date(from: str) ?? Date()
        return date
    }
    
    static func setDateFormat(with str : String) -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = str
        return dateFormatter
    }
    static func toString(date : Date) -> String{
        let dateFormatter = setDateFormat(with: "yyyyMMdd")
        return dateFormatter.string(from: date)
    }
}
