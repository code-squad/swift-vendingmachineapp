//
//  ChocoMilk.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    private var cocoaPowderAmount: Double
    
    init(name: String, volume: Int, brand: String, date: String, fat: Bool, cocoaAmount: Double) {
        self.cocoaPowderAmount = cocoaAmount
        super.init(name: name, volume: volume, price: 1500, brand: brand, date: date, fat: fat)
    }
    
    convenience init() {
        self.init(name: "부산우유",
                  volume: 250,
                  brand: "빙그레초코우유",
                  date: "20190303",
                  fat: true,
                  cocoaAmount: 1.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.cocoaPowderAmount = aDecoder.decodeDouble(forKey: "cocoaPowderAmount")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(cocoaPowderAmount, forKey: "cocoaPowderAmount")
    }
    
    func isHighPowderAmount() -> Bool {
        return cocoaPowderAmount > 1.0
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
