//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class Beverage : CustomStringConvertible {
    
    private let brand : String
    private let volume : Int
    private let price : Int
    private let name : String
    private let manufactured : Date
    private let temperature : Int
    private let kcal : Int
    private let HOTTEMSTANDARD : Int
    private let HIGHCALSTANDARD : Int
    
    init(brand : String, volume : Int, price : Int, name: String, manufactured : Date, temperature : Int, kcal : Int){
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufactured = manufactured
        self.temperature = temperature
        self.kcal = kcal
        self.HOTTEMSTANDARD = 70
        self.HIGHCALSTANDARD = 100
    }
    
    var description: String {
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(Date().yyyyMMddFormat(date: manufactured))"
    }
    
    func isValidate(_ standard: Date) -> Bool{
        let valiDate = Date().expiration(30, manufactured: manufactured)
        return valiDate > standard
    }
    
    func canBuybeverage(money : Money) -> Bool{
        money.canBuybeverage(price: self.price)
    }
    
    func isHot() -> Bool{
        return temperature > self.HOTTEMSTANDARD
    }
    
    func isLowCalorie() -> Bool{
        return kcal > self.HIGHCALSTANDARD
    }
}

extension Beverage : Equatable{
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand && lhs.volume == rhs.volume && lhs.price == rhs.price && lhs.name == rhs.name
    }
}
