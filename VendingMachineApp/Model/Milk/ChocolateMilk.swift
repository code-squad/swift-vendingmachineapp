//
//  ChocolateMilk.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

class ChocolateMilk : Milk {
    
    private let chocolateContent : Float

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: Date, expiredAt: Date, lowFat : Bool, content : Float){
        self.chocolateContent = content
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   lowFat: lowFat)
        
    }
    
    convenience required init() {
        self.init(brand: "서울우유",
                   capacity: 200,
                   price: 900,
                   name: "초코맛 우유",
                   createdAt: Date(),
                   expiredAt: Date().get7daysLatter(),
                   lowFat : false,
                   content : 1.0)
    }
    
    required init?(coder: NSCoder) {
        self.chocolateContent = coder.decodeFloat(forKey: "chocolateContent")
        super.init(coder: coder)
    }
    override func encode(with coder: NSCoder) {
        coder.encode(chocolateContent, forKey: "chocolateContent")
        super.encode(with: coder)
    }
    override var description: String {
        return super.description + ", (\(chocolateContent)%)"
    }
}
