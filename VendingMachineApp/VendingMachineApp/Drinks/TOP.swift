//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
enum TOPKind {
    case sweetAmericano
    case latte
    case black
}

class TOP: Coffee {
    private var topKind: TOPKind
    
    init(name: String, volume: Int, brand: String, date: String, caffeineAmount: Double, topKind: TOPKind) {
        self.topKind = topKind
        super.init(name: name, volume: volume, price: 3500, brand: brand, date: date, caffeineAmount: caffeineAmount)
    }
    
    convenience init() {
        self.init(name: "TOP",
                  volume: 450,
                  brand: "TOP아메리카노",
                  date: "20180505",
                  caffeineAmount: 1.5,
                  topKind: .sweetAmericano)
    }
    
    func isKind(with kind: TOPKind) -> Bool {
        return self.topKind == kind
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
