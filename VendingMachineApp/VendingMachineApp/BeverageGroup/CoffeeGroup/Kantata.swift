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
    convenience init() {
        self.init(brand: "", weight: 0, price: BeveragePrice.kantata, name: "", manufactureDate: Date(), kindOfBeans: "GuatemalaAntiqua")
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, kindOfBeans: String) {
        self.kindOfBeans = kindOfBeans
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "칸타타"
    }
    required init?(coder aDecoder: NSCoder) {
        kindOfBeans = (aDecoder.decodeObject(forKey: "kindOfBeans") as? String) ?? ""
        super.init(coder: aDecoder)
    }
    override func encode(with aCoder: NSCoder) {
        aCoder.encode(kindOfBeans, forKey: "kindOfBeans")
    }
    
    func isGuatemalaBeans() -> Bool {
        return (self.kindOfBeans == "GuatemalaAntiqua")
    }
}
