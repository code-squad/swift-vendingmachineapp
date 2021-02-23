//
//  Brand.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation
enum Brand {
    case Milk(_ select : MilkBrand)
    case Soda(_ select : SodaBrand)
    case Coffee(_ select : CoffeeBrand)

    enum MilkBrand : String {
        case SeoulMilk = "서울우유"
        case BINGGRAE = "빙그레"
        case Maeil = "매일우유"
    }

    enum SodaBrand : String {
        case Pepsi = "펩시"
        case Coca = "코카"
    }

    enum CoffeeBrand : String {
        case Maxim = "맥심"
    }
    
    func printBrand() -> String {
        switch self {
        case .Milk(let T):
            return T.rawValue
        case .Soda(let T):
            return T.rawValue
        case .Coffee(let T):
            return T.rawValue
        }
    }
}
