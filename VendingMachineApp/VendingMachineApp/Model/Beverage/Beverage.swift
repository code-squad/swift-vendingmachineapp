//
//  Beverage.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Codable {
    // 브랜드(String), 무게(Int), 가격(Int), 이름(String), 제조일자(Date)
    private(set) var brand: String
    private(set) var volume: Int
    // 가격은 노출 가능.
    private(set) var price: Int
    private(set) var productName: String
    private(set) var manufacturedDate: Date
    private(set) var expirationDate: Date
    private(set) var calories: Int
    private(set) var menuType: VendingMachine.Menu
    convenience init() {
        self.init("", 0, 0, "", Date(), Date(), 0, .strawberryMilk)
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

    enum CodingKeys: String, CodingKey {
        case brand
        case volume
        case price
        case productName
        case manufacturedDate
        case expirationDate
        case calories
        case menuType
        case manufacturerCode
        case packingMaterial
        case ingredients
        case carbonContent
        case caffeineLevels
        case isHot
        case isSweetened
        case productImageName
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brand, forKey: .brand)
        try container.encode(volume, forKey: .volume)
        try container.encode(price, forKey: .price)
        try container.encode(productName, forKey: .productName)
        try container.encode(manufacturedDate, forKey: .manufacturedDate)
        try container.encode(expirationDate, forKey: .expirationDate)
        try container.encode(calories, forKey: .calories)
        try container.encode(menuType, forKey: .menuType)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try values.decode(String.self, forKey: .brand)
        self.volume = try values.decode(Int.self, forKey: .volume)
        self.price = try values.decode(Int.self, forKey: .price)
        self.productName = try values.decode(String.self, forKey: .productName)
        self.manufacturedDate = try values.decode(Date.self, forKey: .manufacturedDate)
        self.expirationDate = try values.decode(Date.self, forKey: .expirationDate)
        self.calories = try values.decode(Int.self, forKey: .calories)
        self.menuType = try values.decode(VendingMachine.Menu.self, forKey: .menuType)
    }
}
