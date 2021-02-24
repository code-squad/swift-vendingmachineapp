//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation


class Milk: Beverage {

    init(kind: Kind) {
        let info = kind.info()
        super.init(brand: info.brand,
                   name: info.name,
                   price: info.price,
                   size: info.size,
                   manufactured: info.manufactured)
    }

    enum Kind: String {
        case strawberry = "서울우유딸기"
        case chocolate = "허쉬초콜릿드링크"
        case banana = "바나나맛우유"

        func info() -> (brand: String, name: String, price: Int, size: Int, manufactured: Date) {
            switch self {
            case .strawberry:
                return ("서울우유", self.rawValue, 1100, 200, DateGenerator.randomDate())
            case .chocolate:
                return ("허쉬", self.rawValue, 1500, 230, DateGenerator.randomDate())
            case .banana:
                return ("빙그레", self.rawValue, 1300, 250, DateGenerator.randomDate())
            }
        }
    }
}
