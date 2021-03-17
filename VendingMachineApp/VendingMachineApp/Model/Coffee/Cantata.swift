//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/03.
//

import Foundation

class Cantata: Coffee {
    enum Color {
        case brown
        case redBlack
        case orange
    }
    
    private let design: Color
    
    init(brand: String, volume: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, caffeine: Int, design: Color) {
        self.design = design
        super.init(brand: brand, volume: volume, price: price, name: name, createdAt: createdAt, expiredAt: expiredAt, caffeine: caffeine)
    }
    
    required init() {
        design = .brown
        super.init(brand: "롯데칠성", volume: 275, price: 1000, name: "칸타타", createdAt: date, expiredAt: date, caffeine: 156)
    }
    
    required init?(coder decoder: NSCoder) {
        design = decoder.decodeObject(forKey: "design") as! Color
        super.init(coder: decoder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(design, forKey: "design")
        super.encode(with: coder)
    }
    
    
    //MARK:- method
    
    func isdesignNice(color: Color) -> Bool {
        return design == color
    }
}
