//
//  Beverage.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//
import Foundation

typealias ResultGoods = (String, Int) -> Void

class Beverage: NSObject, Codable {

    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturedDate: Date
    private let expiryPeriod: ExpirationPeriod

    init(brand: String,
         volume: Int,
         price: Int,
         name: String,
         manufacturedDate: Date ,
         expiryPeriod: ExpirationPeriod) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expiryPeriod = expiryPeriod
    }

    // Required Initializers
    override required convenience init() {
        self.init(
            brand: "",
            volume: 0,
            price: 0,
            name: "",
            manufacturedDate: Date(),
            expiryPeriod: ExpirationPeriod(endDay: 0)
        )
    }

    override var description: String {
        return "\(name) \(price)"
    }

    var className: String {
        return String(describing: type(of: self))
    }

    //유통기한
    func isEqualExpirationDate() -> Bool {
        let expirationDate = Date.addDate(endDate: expiryPeriod, day: manufacturedDate)
        return Date.isEqualDate(manufacturedDate: expirationDate)
    }

    func canBuy(money: Money) -> Bool {
        return money.isBuy(money: price)
    }

    func subtract(pay: Money) {
        pay.subtract(price: price)
    }

    func doPurchase(goods: ResultGoods) {
        goods(name, price)
    }

    var title: String {
        return name
    }

    func showPurchase(with show: (String, Int) -> Void) {
        show(name, price)
    }
    
    // MARK: - Codable
    enum CodingKeys : String, CodingKey{
        case brand
        case volume
        case price
        case name
        case manufacturedDate
        case expiryPeriod
    }
    
    init(form decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        brand = try value.decode(String.self, forKey: .brand)
        volume = try value.decode(Int.self, forKey: .volume)
        price = try value.decode(Int.self, forKey: .price)
        name = try value.decode(String.self, forKey: .name)
        manufacturedDate = try value.decode(Date.self, forKey: .manufacturedDate)
        expiryPeriod = try value.decode(ExpirationPeriod.self, forKey: .expiryPeriod)
        
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(brand, forKey: .brand)
        try container.encode(volume, forKey: .volume)
        try container.encode(price, forKey: .price)
        try container.encode(name, forKey: .name)
        try container.encode(manufacturedDate, forKey: .manufacturedDate)
        try container.encode(expiryPeriod, forKey: .expiryPeriod)
    }
}
