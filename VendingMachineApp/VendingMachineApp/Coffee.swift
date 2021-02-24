//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Coffee: Beverage {
    
    init(kind: Kind) {
        let info = kind.info()
        super.init(brand: info.brand,
                   name: info.name,
                   price: info.price,
                   size: info.size,
                   manufactured: info.manufactured)
    }

    enum Kind: String {
        case top = "TOP더블랙"
        case georgia = "조지아카페라떼"
        case cantata = "칸타타아메리카노"

        func info() -> (brand: String, name: String, price: Int, size: Int, manufactured: Date) {
            switch self {
            case .top:
                return ("맥심", self.rawValue, 1500, 250, DateGenerator.randomDate())
            case .georgia:
                return ("코카콜라", self.rawValue, 900, 200, DateGenerator.randomDate())
            case .cantata:
                return ("롯데", self.rawValue, 1400, 250, DateGenerator.randomDate())
            }
        }
    }
}
