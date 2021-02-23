//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

enum MilkBrand : String, CustomStringConvertible {
    case seoulMilk = "서울우유"
    case BINGGRAE = "빙그레"
    case Maeil = "매일우유"
    
    var description: String {
        return "\(self.rawValue)"
    }
}

enum SodaBrand : String, CustomStringConvertible {
    case Pepsi = "펩시"
    case Coca = "코카"
    
    var description: String {
        return "\(self.rawValue)"
    }
}

enum CoffeeBrand : String, CustomStringConvertible {
    case Maxim = "맥심"
    
    var description: String {
        return "\(self.rawValue)"
    }
}

class Beverage : CustomStringConvertible {
    private let brand : String
    private let liter : Int
    private let price : Int
    private let name : String
    private let date : Date
    
    init(brand : String, liter : Int, price : Int, name : String, date : String) {
        self.brand = brand
        self.liter = liter
        self.price = price
        self.name = name
        self.date = date.convertDate()
    }
    
    var description: String {
        return "\(brand), \(liter)ml, \(price)원, \(name), \(date.description)"
    }
}
