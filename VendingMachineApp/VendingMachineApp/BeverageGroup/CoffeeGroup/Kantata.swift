//
//  Kantata.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Kantata: Coffee {
    private var kindOfBeans: String = "GuatemalaAntiqua"
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, kindOfBeans: String) {
        self.kindOfBeans = kindOfBeans
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "칸타타"
    }
    
    func isGuatemalaBeans() -> Bool {
        return (self.kindOfBeans == "GuatemalaAntiqua")
    }
}
