//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class BananaMilk: Milk {

    private let colored: Bool // 색소 여부
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, fatPercent: Int, colored: Bool) {
        self.colored = colored
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, fatPercent: fatPercent)
    }
    
    required init() {
        colored = true
        super.init(brand: "서울우유", volume: 200, price: 600, name: "바나나우유", createdAt: date, expiredAt: date, fatPercent: 14)
    }
    
    required init?(coder decoder: NSCoder) {
        colored = decoder.decodeBool(forKey: "colored")
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(colored, forKey: "colored")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    func isColored() -> Bool {
        return colored
    }
}
