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
    
    init(date: Date, fat: Int, cacao: Cacao, hot: Bool, calorie: Int) {
        self.cacao = cacao
        super.init(brand: "매일우유", capacity: 550, price: Money(how: 2000), name: cacao.rawValue, date: date, fat: fat, expiration: Calendar.current.date(byAdding: .day, value: 14, to: date)!, hot: hot, calorie: calorie)
    }
}
