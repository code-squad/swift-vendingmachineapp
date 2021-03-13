//
//  CocaCola.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

class Cola: Soda {
    public enum BottleType {
        case aluminum
        case glass
        case plastic
    }
    private let bottle: BottleType
    
    init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, calories: Int, bottle: BottleType) {
        self.bottle = bottle
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: calories)
    }
    
    convenience override init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date, calories: Int) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: calories, bottle: .aluminum)
    }
    
    convenience init(brand: String, size: Milliliter, price: Int, name: String, packageTime: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, calories: 0, bottle: .aluminum)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(bottle, forKey: "bottle")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        bottle = eDecoder.decodeObject(forKey: "bottle") as! BottleType
        super.init(coder: eDecoder)
    }
}
