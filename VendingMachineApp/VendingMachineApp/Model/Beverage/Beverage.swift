//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Sellable {
    var objectID: ObjectIdentifier { get }
    var productName: String { get }
    var productPrice: Int { get }
}

protocol SellEdible: Sellable {
    var isValidate: Bool { get }
    var isHot: Bool { get }
}

class Beverage {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let expirationDate: Date
    private let temperature: Int
    
    private let hotTemperatureCriterion = 20
    
    init(brand: String, capacity: Int, price: Int, name: String, expirationDate: Date, temperature: Int) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.expirationDate = expirationDate
        self.temperature = temperature
    }
}

extension Beverage: SellEdible {
    var isValidate: Bool {
        return expirationDate >= Date()
    }
    
    var isHot: Bool {
        return temperature > hotTemperatureCriterion
    }
    
    var objectID: ObjectIdentifier {
        let objectType = type(of: self)
        
        return ObjectIdentifier(objectType)
    }
    
    var productName: String {
        return self.name
    }
    
    var productPrice: Int {
        return self.price
    }
}
