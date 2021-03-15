//
//  Soda.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import Foundation

class Soda: Beverage {

    private var sugarContent: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int, sugarContent: Int) {
        self.sugarContent = sugarContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expiredAt: expiredAt, calory: calory)
    }
    
    //MARK: encode 메소드, required init
    override func encode(with coder: NSCoder) {
        coder.encode(self.sugarContent, forKey: "sugarContent")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.sugarContent = coder.decodeInteger(forKey: "sugarContent")
        super.init(coder: coder)
    }
    
    func isUnsweetened(sugar: Int) -> Bool {
        return sugarContent < sugar
    }
}
