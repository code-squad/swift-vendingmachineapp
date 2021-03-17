//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class StrawberryMilk: Milk {
    
    private let cochineal : Bool
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, expirationLimit : Int, cochineal : Bool) {
        self.cochineal = cochineal
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, expirationLimit: expirationLimit)
    }
    
    convenience required init() {
        self.init(brand: "서울우유", volume: 200, charge: 840, name: "딸기우유", manufacturing: Date.init(timeIntervalSince1970: 0), expirationLimit: 3, cochineal: true)
    }
    
    required init?(coder: NSCoder) {
        cochineal = coder.decodeBool(forKey: "cochineal")
        super.init(coder: coder)
    }
    
    func isCochineal() -> Bool {
        return self.cochineal
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(cochineal,forKey: "cochineal")
    }
}
