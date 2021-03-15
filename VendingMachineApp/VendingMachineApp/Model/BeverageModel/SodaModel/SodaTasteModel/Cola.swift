//
//  CocaCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Cola: Soda {
    private let bottle: String
    
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date, calories: Int, bottle: String) {
        self.bottle = bottle
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: calories)
    }
    
    convenience override init(brand: String, size: Int, price: Int, name: String, packageTime: Date, calories: Int) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: calories, bottle: "aluminium")
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(bottle, forKey: "bottle")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        bottle = eDecoder.decodeObject(forKey: "bottle") as! String
        super.init(coder: eDecoder)
    }
}
