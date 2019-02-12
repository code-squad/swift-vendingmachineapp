//
//  TOP.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
enum TOPKind: Int {
    case sweetAmericano = 1, latte, black
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
    
    required init?(coder aDecoder: NSCoder) {
        self.topKind = TOPKind.init(rawValue: aDecoder.decodeInteger(forKey: "topKind")) ?? .latte
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(topKind.rawValue, forKey: "topKind")
    }

    func isKind(with kind: TOPKind) -> Bool {
        return self.topKind == kind
    }
    
    override func convertToImageName() -> String {
        return "TOP"
    }
    
    override func convertToKey() -> String {
        return "\(type(of: TOP()))"
    }
}
