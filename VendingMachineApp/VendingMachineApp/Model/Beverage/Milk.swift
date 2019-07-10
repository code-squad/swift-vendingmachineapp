//
//  Milk.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum MilkGrade {
    case A
    case B
    case C
}

class Milk: Beverage {
    private let grade: MilkGrade
    
    init(grade: MilkGrade, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.grade = grade
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: Date(timeInterval: 432000, since: dateOfManufacture))
    }
    
    func isGradeA() -> Bool {
        return grade == MilkGrade.A
    }
}

class Strawberry: Milk {
    private let strawberryContent: Double
    
    init(strawberryContent: Double, grade: MilkGrade, brand: String, volume: Int, price: Int, productName: String) {
        self.strawberryContent = strawberryContent
        super.init(grade: grade, brand: brand, volume: volume, price: price, productName: productName)
    }
}
class Chocolate: Milk {
    private let chocolateContent: Double
    
    init(chocolateContent: Double, grade: MilkGrade, brand: String, volume: Int, price: Int, productName: String) {
        self.chocolateContent = chocolateContent
        super.init(grade: grade, brand: brand, volume: volume, price: price, productName: productName)
    }
}
