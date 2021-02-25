//
//  File.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class ChocoMilk: Milk {
    
    enum Cacao: String {
        case Original = "Choco Milk"
        case SixtyPercent = "60% Cacaco Choco Milk"
        case NinetyPercent  = "90% Cacaco Choco Milk"
        
        
        func price() -> Int {
            switch self {
            case .Original:
                return 2000
            case .SixtyPercent:
                return 2500
            case .NinetyPercent:
                return 2800
            }
        }
    }
    
    private var cacao: Cacao
    
    init(date: Date, lowFat: Bool, cacao: Cacao) {
        self.cacao = cacao
        super.init(brand: "매일우유", capacity: 550, price: cacao.price(), name: cacao.rawValue, date: date, lowFat: lowFat)
    }
}
