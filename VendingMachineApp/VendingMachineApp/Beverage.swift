//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Beverage {
    private let brand: String
    private let size: Int
    private let price: Int
    private let name: String
    private let packDate: Date
    
    
    public init(brandName: String, sizeInMilliliter: Int, itemPrice: Int, itemName: String, manufacturingDate: Date) {
        brand = brandName
        size = sizeInMilliliter
        price = itemPrice
        name = itemName
        packDate = manufacturingDate
    }

    private func generateDate(year newYear: Int, month newMonth: Int, day newDay: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = newYear
        dateComponents.month = newMonth
        dateComponents.day = newDay
        dateComponents.timeZone = TimeZone(abbreviation: "JST")
        
        let userCalendar = Calendar(identifier: .gregorian)
        guard let someDateTime = userCalendar.date(from: dateComponents) else { return Date(timeIntervalSinceReferenceDate: -123456789.0)}
        
        return someDateTime
    }
}
