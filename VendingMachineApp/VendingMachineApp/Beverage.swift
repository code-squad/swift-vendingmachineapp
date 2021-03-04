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
    
    init(brand : String, volume : Int, price : Int, name: String, manufactured : Date, temperature : Int, kcal : Int){
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufactured = manufactured
        self.temperature = temperature
        self.kcal = kcal
    }
    
    var description: String {
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(Date().yyyyMMddFormat(date: manufactured))"
    }
    
    func isValidate(with date: Date) -> Bool{
        if let valiDate = Calendar.current.date(byAdding: .day, value: 30, to: self.manufactured){
            if valiDate > date {
                return true
            }
        }
        return false
    }
    
    func canBuybeverage(money : Money) -> Bool{
        if money.currentMoney() > self.price {
            return true
        }
        return false
    }
    
    func isHot() -> Bool{
        if temperature > 70{
            return true
        }
        return false
    }
    
    func isLowCalorie() -> Bool{
        if kcal > 100 {
            return true
        }
        return false
    }
    
    func addtoVendingMachine(vendingMachine : VendingMachine) -> Void{
        //override subclass
    }
}

extension Beverage : Equatable{
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand && lhs.volume == rhs.volume && lhs.price == rhs.price && lhs.name == rhs.name
    }
}
