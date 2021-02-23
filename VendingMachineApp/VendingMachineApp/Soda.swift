//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Soda: Beverage {

    let brand: String
    let name: String
    let price: Int
    let size: Int
    let manufactureDate: Date

    init(kind: Kind) {
        let info = kind.info()
        self.brand = info.brand
        self.name = info.name
        self.price = info.price
        self.size = info.size
        self.manufactureDate = info.manufactureDate
    }

    enum Kind: String {
        case cola = "코카콜라"
        case sprite = "칠성사이다"
        case fanta = "환타오렌지"

        func info() -> (brand: String, name: String, price: Int, size: Int, manufactureDate: Date) {
            switch self {
            case .cola:
                return ("코카콜라", self.rawValue, 2000, 500, Date(timeIntervalSinceNow: 0))
            case .sprite:
                return ("롯데칠성음료", self.rawValue, 1700, 500, Date(timeIntervalSinceNow: 0))
            case .fanta:
                return ("코카콜라", self.rawValue, 2100, 480, Date(timeIntervalSinceNow: 0))
            }
        }
    }

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactureDate))"
    }
}
