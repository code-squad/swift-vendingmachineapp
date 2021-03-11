//
//  Banana.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import Foundation

class Banana: Milk {
    
    private let countryOfOrigin: String
    
    init(countryOfOrigin: String) {
        self.countryOfOrigin = countryOfOrigin
        super.init(brand: "빙그레", volume: 240, price: 900, name: "바나나맛 우유", manufacturedAt: Date().addingTimeInterval(800000), temparature: 3, calories: 120, fat: 1)
    }
    
    required init?(coder: NSCoder) {
        self.countryOfOrigin = coder.decodeObject(forKey: "bananaCountryOfOrigin") as? String ?? ""
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(countryOfOrigin, forKey: "bananaCountryOfOrigin")
        super.encode(with: coder)
    }
}
