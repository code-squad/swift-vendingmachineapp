//
//  Soda.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Soda: Beverage {

    init(kind: Kind) {
        let info = kind.info()
        super.init(brand: info.brand,
                   name: info.name,
                   price: info.price,
                   size: info.size,
                   manufactured: info.manufactured)
    }

    enum Kind: String {
        case cola = "코카콜라"
        case sprite = "칠성사이다"
        case fanta = "환타오렌지"

        func info() -> (brand: String, name: String, price: Int, size: Int, manufactured: Date) {
            switch self {
            case .cola:
                return ("코카콜라", self.rawValue, 2000, 500, DateGenerator.randomDate())
            case .sprite:
                return ("롯데칠성음료", self.rawValue, 1700, 500, DateGenerator.randomDate())
            case .fanta:
                return ("코카콜라", self.rawValue, 2100, 480, DateGenerator.randomDate())
            }
        }
    }
}
