//
//  Fanta.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
enum FantaFlavor: Int {
    case grape = 1, orange
}

class Fanta: CarbonatedDrink {
    private var fantaFlavor: FantaFlavor
    
    init(name: String, volume: Int, brand: String, date: String, isZeroCalorie: Bool, fantaFlavor: FantaFlavor) {
        self.fantaFlavor = fantaFlavor
        super.init(name: name, volume: volume, price: 2000, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    convenience init() {
        self.init(name: "환타",
                  volume: 350,
                  brand: "다이어트환타",
                  date: "20191009",
                  isZeroCalorie: false,
                  fantaFlavor: .orange)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.fantaFlavor = FantaFlavor.init(rawValue: aDecoder.decodeInteger(forKey: "fantaFlavor")) ?? .grape
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(fantaFlavor.rawValue, forKey: "fantaFlavor")
    }
    
    func isFlavor(with flavor: FantaFlavor) -> Bool {
        return self.fantaFlavor == flavor
    }
    
    override func convertToImageName() -> String {
        return "환타"
    }
    
    override func convertToKey() -> String {
        return "\(type(of: Fanta()))"
    }
}
