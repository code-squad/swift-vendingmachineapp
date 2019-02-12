//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Cola: CarbonatedDrink {
    private var sugarAmount: Double
    
    init(name: String, volume: Int, brand: String, date: String, isZeroCalorie: Bool, sugarAmount: Double) {
        self.sugarAmount = sugarAmount
        super.init(name: name, volume: volume, price: 2000, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    convenience init() {
        self.init(name: "콜라",
                  volume: 350,
                  brand: "다이어트콜라",
                  date: "20190303",
                  isZeroCalorie: false,
                  sugarAmount: 0.9)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.sugarAmount = aDecoder.decodeDouble(forKey: "sugarAmount")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(sugarAmount, forKey: "sugarAmount")
    }
    
    func isHighSugarAmount() -> Bool {
        return sugarAmount > 1.0
    }
    
    override func convertToImageName() -> String {
        return "콜라"
    }
    
    override func convertToKey() -> String {
        return "\(type(of: Cola()))"
    }
}
