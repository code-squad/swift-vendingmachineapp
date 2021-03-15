//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/02.
//

import Foundation

class StrawberryMilk: Milk {
    
    enum FarmCode: String {
        case A = "A", B = "B", C = "C", D = "D"
    }
    
    private var farmCode: FarmCode
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date, temperature: Double, expiredAt: Date, calory: Int, fatContent: Double, farmCode: FarmCode) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturedAt: manufacturedAt, temperature: temperature, expiredAt: expiredAt, calory: calory, fatContent: fatContent)
    }
    
    //MARK: encode 메소드, required init
    override func encode(with coder: NSCoder) {
        coder.encode(self.farmCode.rawValue, forKey: "farmCode")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.farmCode = FarmCode(rawValue: coder.decodeObject(forKey: "farmCode") as! String)!
        super.init(coder: coder)
    }
    
}
