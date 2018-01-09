//
//  Beverage.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Beverage: Product, CustomStringConvertible {
    typealias MenuType = VendingMachine.MenuType

    // 브랜드(String), 무게(Int), 가격(Int), 이름(String), 제조일자(Date)
    private(set) var brand: String
    private(set) var volume: Int
    // 가격은 노출 가능.
    private(set) var price: Int
    private(set) var productName: String
    private(set) var manufacturedDate: Date
    private(set) var expirationDate: Date
    private(set) var calories: Int
    private(set) var menuType: VendingMachine.MenuType
    init() {
        brand = ""
        volume = 0
        price = 0
        productName = ""
        manufacturedDate = Date(timeIntervalSinceNow: 0)
        expirationDate = Date(timeIntervalSinceNow: 0)
        calories = 0
        menuType = .strawberryMilk
    }
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String,
         _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate
        self.calories = calories
        self.menuType = menuType
    }

    func isExpired(with date: Date) -> Bool {
        return expirationDate < date
    }

    func isLowCalorie() -> Bool {
        return calories < 100
    }

    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("YYYYMMdd")
        return "\(brand), \(volume)ml, \(price)원, \(productName), \(dateFormatter.string(from: manufacturedDate))"
    }
}
