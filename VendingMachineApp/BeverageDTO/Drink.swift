//
//  Drink.swift
//  VendingMachine
//
//  Created by hw on 02/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

public typealias CaloryElements = (carbon: Int, protein: Int, fat: Int )

class Drink{
    private let brand: String
    private var quantity: Int
    private var price: Int
    private (set) var name: String
    private var validDate: Date
    private (set) var temperature: Double
    
    private let caloryElements : CaloryElements

    var caloriesInfo : Int {
        get {
            return caloryElements.fat*9 + caloryElements.carbon*4 + caloryElements.protein*4
        }
    }
    
    func displaySoldProductInfo(drinkInfo: (String, Int) -> InstructionResult) -> InstructionResult{
        return drinkInfo(self.name, self.price)
    }
    
    func displayDrinkInfo(drinkInfo: (String, String, Int, Int) -> Void){
        drinkInfo(self.brand, self.name, self.price, self.quantity)
    }
    
    func displayModifiedStock(format: (String) -> InstructionResult) -> InstructionResult{
        return format(self.name)
    }
    
    /// 현재 저장된 것보다 3개월 가산하여 더미재고 추가
    func updateDateInfo(days: Int ){
        self.validDate = CustomDateFormatter.daysAfter(after: days)
    }
    
    convenience init (
                        brand: String,
                        quantity: Int,
                        price: Int,
                        name: String,
                        date: Date = Date.init(),
                        temperature: Double = 4.0
                    ){
        let calorySet = CaloryElements(carbon: 0, protein: 0, fat: 0 )
        self.init(brand: brand, quantity: quantity, price: price, name: name, date: date, caloryElements: calorySet, temp: temperature)
    }
    
    init(
            brand: String,
            quantity: Int,
            price: Int,
            name: String,
            date: Date = Date.init(),
            caloryElements: CaloryElements,
            temp temperature: Double
        ){
        self.brand = brand
        self.quantity = quantity
        self.price = price
        self.name = name
        self.validDate = date
        self.caloryElements = caloryElements
        self.temperature = temperature
    }
    
    var date : Date {
        get {
            return validDate
        }
    }
}

extension Drink : Drinkable {
    
    func display(printFormat: (Drinkable) -> Void) {
        printFormat(self)
    }
    
    func validate(with date:Date) -> Bool {
        let isValid = self.date > date ? true : false
        return isValid
    }
    func isLowCalories() -> Bool {
        let isLow = self.caloriesInfo < 50 ? true : false
        return isLow
    }
    
    func isHot() -> Bool {
        let isHot = self.temperature > 20 ? true : false
        return isHot
    }
}

extension Drink: CustomStringConvertible {
    var description: String {
        var result = [String]()
        result.append(self.brand)
        result.append(String.init(format: "%d\(Units.millilter)", self.quantity))
        result.append(String.init(format: "%d\(Currency.won)", self.price))
        result.append(self.name)
        result.append(CustomDateFormatter.convertDateToString(self.validDate))
        return "\(type(of: self)) - \(result.joined(separator: ", "))"
    }
}
