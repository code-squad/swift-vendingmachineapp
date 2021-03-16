//
//  Milk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Milk : Beverage {
    private var fatContent : Int
    
    init(fatContent : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int, kcal : Int) {
        self.fatContent = fatContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal : kcal)
    }
    
    convenience init(brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature : Int){ //저지방 우유
        self.init(fatContent : 10, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal: 50)
    }
    
    required convenience init(manufactured: Date) {
        self.init(fatContent : 10, brand: "서울우유", volume: 180, price: 2100, name: "서울우유", manufactured: manufactured, temperature : 10, kcal: 50)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.fatContent, forKey: "fatContent")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.fatContent = coder.decodeInteger(forKey: "fatContent")
        super.init(coder: coder)
    }
    
}
