//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class Beverage : NSObject, NSCoding {
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
    
    required init(manufactured : Date) {
        self.brand = ""
        self.volume = 0
        self.price = 0
        self.name = ""
        self.manufactured = manufactured
        self.temperature = 0
        self.kcal = 0
        self.HOTTEMSTANDARD = 0
        self.HIGHCALSTANDARD = 0
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.brand, forKey: "brand")
        coder.encode(self.volume, forKey: "volume")
        coder.encode(self.price, forKey: "price")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.manufactured, forKey: "manufactured")
        coder.encode(self.temperature, forKey: "temperature")
        coder.encode(self.kcal, forKey: "kcal")
        coder.encode(self.HOTTEMSTANDARD, forKey: "HOTTEMSTANDARD")
        coder.encode(self.HIGHCALSTANDARD, forKey: "HIGHCALSTANDARD")
    }
    
    required init?(coder: NSCoder) {
        self.brand = coder.decodeObject(forKey: "brand") as? String ?? ""
        self.volume = coder.decodeObject(forKey: "volume") as? Int ?? 0
        self.price = coder.decodeObject(forKey: "price") as? Int ?? 0
        self.name = coder.decodeObject(forKey: "name") as? String ?? ""
        self.manufactured = coder.decodeObject(forKey: "manufactured") as? Date ?? Date()
        self.temperature = coder.decodeObject(forKey: "temperature") as? Int ?? 0
        self.kcal = coder.decodeObject(forKey: "kcal") as? Int ?? 0
        self.HOTTEMSTANDARD = coder.decodeObject(forKey: "HOTTEMSTANDARD") as? Int ?? 0
        self.HIGHCALSTANDARD = coder.decodeObject(forKey: "HIGHCALSTANDARD") as? Int ?? 0
    }
    
    
    override var description: String {
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.name), \(manufactured.descriptDateToString())"
    }
    
    func isValidate(_ standard: Date) -> Bool{
        let thirtydaysAfter = Date().expiration(30, manufactured: manufactured)
        return thirtydaysAfter > standard
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
    
    func addProduct(productList : inout [String: Int]){
        if productList[self.name] == nil{
            productList[self.name] = 1
        }
        else{
            productList[self.name]! += 1
        }        
    }
    
    func addProductType(productTypeList : inout [ObjectIdentifier : Int]){
        if productTypeList[ObjectIdentifier(self)] == nil{
            productTypeList[ObjectIdentifier(self)] = 1
        }
        else{
            productTypeList[ObjectIdentifier(self)]! += 1
        }
    }
}

extension Beverage{
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.brand == rhs.brand && lhs.volume == rhs.volume && lhs.price == rhs.price && lhs.name == rhs.name
    }
}
