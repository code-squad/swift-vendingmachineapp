//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class Cantata: Coffee {
    
    enum BeanOrigin {
        case colombia
        case ethiopia
        case congo
    }
    
    private var beanOrigin: BeanOrigin
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expirationDate: Date, calory: Int, caffeineContent: Int, beanOrigin: BeanOrigin) {
        self.beanOrigin = beanOrigin
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expirationDate: expirationDate, calory: calory, caffeineContent: caffeineContent)
    }
}
