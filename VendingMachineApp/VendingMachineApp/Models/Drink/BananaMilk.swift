//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/24.
//

import Foundation

class BananaMilk: Milk  {
    private let farmCode: String
    override var imageName: String {
        return "banana_milk"
    }
    
    init(manufacturer: String, volume: Int, name: String, manufacturedAt: Date, price: Int, temperature: Int, calorie: Int, fatContent: Int, farmCode: String, expiredAt: Date) {
        self.farmCode = farmCode
        super.init(manufacturer: manufacturer, volume: volume, name: name, manufacturedAt: manufacturedAt, price: price, temperature: temperature, calorie: calorie, fatContent: fatContent, expiredAt: expiredAt)
    }
    
    required init?(coder: NSCoder) {
        self.farmCode = coder.decodeObject(forKey: "farmCode") as! String
        super.init(coder: coder)
    }
    
    required convenience init() {
        self.init(manufacturer: "빙그레", volume: 200, name: "빙그레바나나우유", manufacturedAt: Date(), price: 1000, temperature: 20, calorie: 200, fatContent: 5, farmCode: "B", expiredAt: Date())
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(farmCode, forKey: "farmCode")
        super.encode(with: coder)
    }
}
