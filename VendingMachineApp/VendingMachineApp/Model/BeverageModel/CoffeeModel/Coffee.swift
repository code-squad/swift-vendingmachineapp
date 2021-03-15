//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import Foundation

class Coffee: Beverage {
    private let bean: String
    
    init(brand: String, size: Int, price: Int, name: String, packageTime: Date, bean: String) {
        self.bean = bean
        super.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime)
    }
    
    convenience override init(brand: String, size: Int, price: Int, name: String, packageTime: Date) {
        self.init(brand: brand, size: size, price: price, name: name, packageTime: packageTime, bean: "robusta")
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(bean, forKey: "bean")
        super.encode(with: coder)
    }
    
    required init?(coder eDecoder: NSCoder) {
        bean = eDecoder.decodeObject(forKey: "bean") as! String
        super.init(coder: eDecoder)
    }
}
