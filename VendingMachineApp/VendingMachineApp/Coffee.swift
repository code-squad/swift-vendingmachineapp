//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Coffee: Beverage {

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
        case top = "TOP더블랙"
        case georgia = "조지아카페라떼"
        case cantata = "칸타타아메리카노"

        func info() -> (brand: String, name: String, price: Int, size: Int, manufactureDate: Date) {
            switch self {
            case .top:
                return ("맥심", self.rawValue, 1500, 250, Date(timeIntervalSinceNow: 0))
            case .georgia:
                return ("코카콜라", self.rawValue, 900, 200, Date(timeIntervalSinceNow: 0))
            case .cantata:
                return ("롯데", self.rawValue, 1400, 250, Date(timeIntervalSinceNow: 0))
            }
        }
    }

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactureDate))"
    }
}
