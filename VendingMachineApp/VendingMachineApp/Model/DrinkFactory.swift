//
//  DrinkFactory.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/04.
//

import Foundation

class DrinkFactory {
    static let shared = DrinkFactory()
    
    static func createBeverage(with beverageType: BeverageType) -> Productable {
        switch beverageType {
        case .cola:
            return Cola()
        case .strawberrymilk:
            return StrawBerryMilk()
        case .redbull:
            return RedBull()
        case .top:
            return TOP()
        }
    }
}

enum BeverageType {
    case cola, strawberrymilk, redbull, top
}
