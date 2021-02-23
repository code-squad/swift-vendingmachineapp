//
//  Milk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation


class Milk: Beverage {

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
        case strawberry = "서울우유딸기"
        case chocolate = "허쉬초콜릿드링크"
        case banana = "바나나맛우유"

        func info() -> (brand: String, name: String, price: Int, size: Int, manufactureDate: Date) {
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

    var description: String {
        return "[\(brand)] \(name): ₩\(price), \(size)ml (\(manufactureDate.description))"
    }
}
