//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

enum BeverageCategory {
    case milk
    case softDrink
    case coffee
}

class Beverage: CustomStringConvertible {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturingDate: Date
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturingDate: Date())
    }
    
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturingDate)"
    }
}

class Milk: Beverage {
    private let beverageType: BeverageCategory
    
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.beverageType = .milk
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    convenience init() {
        self.init(brand: "brand", volume: 0, price: 0, name: "name", manufacturingDate: Date())
    }
    
}

func dateFormatter(year: Int, month: Int, day: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    var dateComponents = DateComponents()
    
    dateComponents.year = year
    dateComponents.month = month
    dateComponents.day = day
    
    let date = calendar.date(from: dateComponents) ?? Date()

//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "YY년 MM월 dd일"
//
////    let string1 = "18년 2월 1일"
//
//    let day = dateFormatter.date(from: date)
    return date
}

let date = dateFormatter(year: 2020, month: 12, day: 20)

class StrawberryMilk: Milk {
    override init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        super.init(brand: "서울우유", volume: 200, price: 1000, name: "딸기우유", manufacturingDate: date)
    }
}
