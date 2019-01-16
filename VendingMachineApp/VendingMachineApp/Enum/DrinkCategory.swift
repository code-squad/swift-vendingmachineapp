//
//  DrinkCategory.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

enum DrinkCategory: Int, CaseIterable {
    case bananaMilk = 1, chocoMilk, cola, fanta, cantata, top
    
    func convertToKey() -> String {
        switch self {
        case .bananaMilk: return "\(type(of: BananaMilk()))"
        case .chocoMilk: return "\(type(of: ChocoMilk()))"
        case .cola: return "\(type(of: Cola()))"
        case .fanta: return "\(type(of: Fanta()))"
        case .cantata: return "\(type(of: Cantata()))"
        case .top: return "\(type(of: TOP()))"
        }
    }
    
    func getPriceEachCategory() -> Int {
        switch self {
        case .bananaMilk: return 1500
        case .chocoMilk: return 1500
        case .cola: return 2000
        case .fanta: return 2000
        case .cantata: return 3000
        case .top: return 3500
        }
    }
    
    func createDrinkByMenu() -> Beverage {
        switch self {
        case .bananaMilk: return BananaMilk()
        case .chocoMilk: return ChocoMilk()
        case .cola: return Cola()
        case .fanta: return Fanta()
        case .cantata: return Cantata()
        case .top: return TOP()
        }
    }
}
