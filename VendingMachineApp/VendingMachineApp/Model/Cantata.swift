//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Cantata: Coffee {
    
    enum BeanOrigin: String {
        case colombia = "colombia"
        case ethiopia = "ethiopia"
        case congo = "congo"
    }
    
    private var beanOrigin: BeanOrigin
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int, caffeineContent: Int, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expiredAt: expiredAt, calory: calory, caffeineContent: caffeineContent)
    }
    
    //MARK: encode 메소드, required init
    override func encode(with coder: NSCoder) {
        coder.encode(self.beanOrigin.rawValue, forKey: "beanOrigin")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.beanOrigin = BeanOrigin(rawValue: coder.decodeObject(forKey: "beanOrigin") as! String)!
        super.init(coder: coder)
    }
}
