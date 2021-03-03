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
    }
    
    private var cacao: Cacao
    
    init(date: Date, fat: Int, cacao: Cacao, expiration: Date, hot: Bool, calorie: Int) {
        self.cacao = cacao
        super.init(brand: "매일우유", capacity: 550, price:2000, name: cacao.rawValue, date: date, fat: fat, expiration: expiration, hot: hot, calorie: calorie)
    }
}
