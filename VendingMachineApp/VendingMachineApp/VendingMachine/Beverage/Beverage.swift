//
//  Beverage.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject, Codable {
    private let brand: String
    private let name: String
    private let volume: Int
    private let price: Int
    private let dateOfManufacture: Date

    init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date) {
        self.brand = brand
        self.name = name
        self.volume = volume
        self.price = price
        self.dateOfManufacture = dateOfManufacture
    }

    convenience required override init() {
        self.init(
            brand: "노브랜드",
            name: "물",
            volume: 500,
            price: 800,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 30))
    }

    override var description: String {
        return "\(name) \(price)원"
    }

    var className: String {
        return String(describing: type(of: self))
    }

    var title: String {
        return name
    }

    func isBuyable(for cash: Int) -> Bool {
        return price <= cash
    }

    func subtractPrice(from balance: Int) -> Int {
        return balance - price
    }

}

extension Beverage {

    func showPurchase(with show: (String, Int) -> Void) {
        show(name, price)
    }

}
